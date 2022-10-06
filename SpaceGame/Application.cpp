#include "Common.h"
#include "Engine/Engine.h"
#include "Engine/Input.h"
#include "Engine/Models.h"
#include "Engine/Rendering/Shaders.h"

using namespace promise;
using namespace std::literals;

tl::expected<std::string, std::string> read_file(const std::string& filename)
{
	if (const auto file = std::fstream(filename))
	{
		auto out = std::stringstream();
		out << file.rdbuf();
		return out.str();
	}
	
	return tl::make_unexpected("failed to read "s + filename);
}

void APIENTRY gl_message_callback(
	GLenum source, GLenum type, unsigned int id, GLenum severity,
	GLsizei length, const char* message, const void* userParam);

int main()
{
	glfwInit();

	glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 4);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 5);
#ifndef NDEBUG
	glfwWindowHint(GLFW_OPENGL_DEBUG_CONTEXT, true);
#endif
	const auto window = glfwCreateWindow(800, 600, "spaaaaace", nullptr, nullptr);
	glfwMakeContextCurrent(window);
	
	gladLoadGLLoader((GLADloadproc) glfwGetProcAddress);

#ifndef NDEBUG
	glEnable(GL_DEBUG_OUTPUT);
	glEnable(GL_DEBUG_OUTPUT_SYNCHRONOUS);
	glDebugMessageCallback(gl_message_callback, nullptr);
	glDebugMessageControl(GL_DONT_CARE, GL_DONT_CARE, GL_DONT_CARE, 0, nullptr, true);
#endif
	
	ShaderPipeline debug;
	debug.add_shader("res/shaders/debug.vert", GL_VERTEX_SHADER);
	debug.add_shader("res/shaders/debug.frag", GL_FRAGMENT_SHADER);
	debug.link();
	debug.use();
	
	auto& u_camera_mvp = debug["camera_mvp"];
	auto& u_camera_model = debug["camera_model"];
	auto& u_camera_model_inv = debug["camera_model_inv"];
	auto& u_camera_pos = debug["camera_pos"];

	auto camera_pos = glm::vec3 { 0, 0.5, 4 };

	glEnable(GL_DEPTH_TEST);
	glDepthFunc(GL_LESS);

	glEnable(GL_CULL_FACE);
	glCullFace(GL_BACK);
	glFrontFace(GL_CCW);
	
	std::vector<std::shared_ptr<Actor>> actors;
	auto ship = actors.emplace_back(std::make_shared<Actor>("res/models/ship.obj"));
	auto station = actors.emplace_back(std::make_shared<Actor>("res/models/station.obj"));
	station->position = { 4, 0, -10 };

	{
		Model model_asteroids("res/models/asteroids.obj");
		auto n_meshes = float(model_asteroids.meshes.size());
		auto angle = glm::identity<glm::quat>();
		for (auto& asteroid : model_asteroids.meshes | std::views::values)
		{
			auto actor = actors.emplace_back(std::make_shared<Actor>(Model{ asteroid }));
			angle *= angleAxis(glm::two_pi<float>() / n_meshes, glm::vec3(0, 1, 0));
			actor->position = angle * glm::vec3(0, 0, -5);
		}
	}

	glClearColor(0.4, 0.6, 0.9, 0.0);
	while (!glfwWindowShouldClose(window))
	{
		glfwPollEvents();

		static double time = glfwGetTime();
		double now = glfwGetTime();
		auto dt = float(now - time);
		time = now;

		input::update(window);

		if (input::is_pressed(GLFW_KEY_ESCAPE))
		{
			glfwSetWindowShouldClose(window, true);
		}

		static bool is_movement_enabled = false;
		if (glfwGetMouseButton(window, GLFW_MOUSE_BUTTON_LEFT))
		{
			glfwSetInputMode(window, GLFW_CURSOR, GLFW_CURSOR_DISABLED);
			is_movement_enabled = true;

			if (glfwRawMouseMotionSupported())
			{
				glfwSetInputMode(window, GLFW_RAW_MOUSE_MOTION, GLFW_TRUE);
			}
		}

		static double last_mouse_x, last_mouse_y;
		double current_mouse_x, current_mouse_y;
		glfwGetCursorPos(window, &current_mouse_x, &current_mouse_y);
		float dt_mouse_x = 0.f, dt_mouse_y = 0.f;
		if (is_movement_enabled)
		{
			dt_mouse_x = glm::radians(float(current_mouse_x - last_mouse_x) / 4);
			dt_mouse_y = glm::radians(float(current_mouse_y - last_mouse_y) / 4);
		}
		last_mouse_x = current_mouse_x;
		last_mouse_y = current_mouse_y;
		
		ship->rotation *= angleAxis(-dt_mouse_x, glm::vec3 { 0, 1, 0 });
		ship->rotation *= angleAxis(-dt_mouse_y, glm::vec3 { 1, 0, 0 });

		glm::vec3 motion {};
		motion += ship->rotation * glm::vec3 {
			-input::map_key(GLFW_KEY_A, GLFW_KEY_D),
			-input::map_key(GLFW_KEY_LEFT_CONTROL, GLFW_KEY_SPACE),
			-input::map_key(GLFW_KEY_W, GLFW_KEY_S)
		};
		if (is_movement_enabled and length2(motion) > FLT_EPSILON)
		{
			ship->position += normalize(motion) * dt;
		}

		glm::quat camera_rot = conjugate(ship->rotation);
		camera_pos = ship->position + ship->rotation * glm::vec3(0, 1, 4);

		if (input::get_key(GLFW_KEY_TAB).is_down)
		{
			camera_rot = glm::identity<glm::quat>();
			camera_pos = glm::vec3(0, 0.5, 4);
		}

		glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
		
		glm::mat4
			view = mat4_cast(camera_rot) * translate(glm::mat4(1.0f), -camera_pos),
			proj = glm::perspectiveFov(glm::radians(60.f), 800.f, 600.f, 0.1f, 100.f);
		glm::mat4 vp = proj * view;
		
		station->rotation *= angleAxis(glm::pi<float>() / 2 * dt, glm::vec3 { 0, 1, 0 });
		for (const auto& actor : actors)
		{
			glm::mat4 model = actor->get_model_matrix();
			u_camera_mvp = vp * model;
			u_camera_model = model;
			u_camera_model_inv = inverse(model);
			u_camera_pos = camera_pos;
			actor->draw();
		}
		
		glfwSwapBuffers(window);
	}
}

void APIENTRY gl_message_callback(
	GLenum source, GLenum type, unsigned int id, GLenum severity,
	GLsizei length, const char* message, const void* userParam)
{
	// ignore non-significant error/warning codes
	if (id == 131169 || id == 131185 || id == 131218 || id == 131204) return;

	std::cout << "---------------" << std::endl;
	std::cout << "Debug message (" << id << "): " << message << std::endl;

	switch (source)
	{
	case GL_DEBUG_SOURCE_API: std::cout << "Source: API";
		break;
	case GL_DEBUG_SOURCE_WINDOW_SYSTEM: std::cout << "Source: Window System";
		break;
	case GL_DEBUG_SOURCE_SHADER_COMPILER: std::cout << "Source: Shader Compiler";
		break;
	case GL_DEBUG_SOURCE_THIRD_PARTY: std::cout << "Source: Third Party";
		break;
	case GL_DEBUG_SOURCE_APPLICATION: std::cout << "Source: Application";
		break;
	case GL_DEBUG_SOURCE_OTHER: std::cout << "Source: Other";
		break;
	}
	std::cout << std::endl;

	switch (type)
	{
	case GL_DEBUG_TYPE_ERROR: std::cout << "Type: Error";
		break;
	case GL_DEBUG_TYPE_DEPRECATED_BEHAVIOR: std::cout << "Type: Deprecated Behaviour";
		break;
	case GL_DEBUG_TYPE_UNDEFINED_BEHAVIOR: std::cout << "Type: Undefined Behaviour";
		break;
	case GL_DEBUG_TYPE_PORTABILITY: std::cout << "Type: Portability";
		break;
	case GL_DEBUG_TYPE_PERFORMANCE: std::cout << "Type: Performance";
		break;
	case GL_DEBUG_TYPE_MARKER: std::cout << "Type: Marker";
		break;
	case GL_DEBUG_TYPE_PUSH_GROUP: std::cout << "Type: Push Group";
		break;
	case GL_DEBUG_TYPE_POP_GROUP: std::cout << "Type: Pop Group";
		break;
	case GL_DEBUG_TYPE_OTHER: std::cout << "Type: Other";
		break;
	}
	std::cout << std::endl;

	switch (severity)
	{
	case GL_DEBUG_SEVERITY_HIGH: std::cout << "Severity: high";
		break;
	case GL_DEBUG_SEVERITY_MEDIUM: std::cout << "Severity: medium";
		break;
	case GL_DEBUG_SEVERITY_LOW: std::cout << "Severity: low";
		break;
	case GL_DEBUG_SEVERITY_NOTIFICATION: std::cout << "Severity: notification";
		break;
	}
	std::cout << std::endl << std::endl;
}
