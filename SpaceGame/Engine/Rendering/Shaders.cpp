#include "Engine/Rendering/Shaders.h"

using namespace engi;

ShaderUniform::ShaderUniform(const uint32_t in_program, const char* name)
	: program(in_program)
	, location(glGetUniformLocation(in_program, name))
{
}

ShaderUniform::ShaderUniform(const uint32_t in_program, const int in_location): program(in_program)
  , location(in_location)
{
}

ShaderUniform& ShaderUniform::operator=(const glm::mat4& value)
{
	glProgramUniformMatrix4fv(program, location, 1, false, value_ptr(value));
	return *this;
}

ShaderUniform& ShaderUniform::operator=(const glm::vec3& value)
{
	glProgramUniform3fv(program, location, 1, value_ptr(value));
	return *this;
}

std::optional<std::string> ShaderPipeline::add_shader(std::string file, GLenum shader_type) noexcept
{
	auto content = read_file(file);
	if (content)
	{
		const auto shader_text = content->c_str();
		const auto shader = glCreateShader(shader_type);
		glShaderSource(shader, 1, &shader_text, nullptr);
		glCompileShader(shader);
		shaders[length++] = shader;

		return {};
	}
	return content.error();
}

void ShaderPipeline::link()
{
	program = glCreateProgram();
	for (int i = 0; i < length; i++)
	{
		glAttachShader(program, shaders[i]);
		glDeleteShader(shaders[i]);
	}
	glLinkProgram(program);

	use();

	int n_active_uniforms;
	glGetProgramiv(program, GL_ACTIVE_UNIFORMS, &n_active_uniforms);
	for (int i = 0; i < n_active_uniforms; i++)
	{
		GLenum type;
		int name_length = 64, size = 0;
		char name[64];
		glGetActiveUniform(program, i, name_length, &name_length, &size, &type, name);
		uniforms.try_emplace(std::string(name, name_length), program, i);
	}

	int length = 0;
	char log[2048];
	glGetProgramInfoLog(program, 2048, &length, log);
	std::cout << std::string(log, length) << std::endl;
}

void ShaderPipeline::use() const
{
	if (static uint32_t selected = 0; selected != program)
	{
		glUseProgram(selected = program);
	}
}

ShaderUniform& ShaderPipeline::operator[](const char* uniform)
{
	if (const auto at = uniforms.find(uniform); at != uniforms.end())
	{
		return at->second;
	}
	throw std::exception("invalid uniform name");
}
