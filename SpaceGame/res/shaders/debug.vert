#version 450 core

layout (location=0) in vec3 position;
layout (location=1) in vec3 normal;
layout (location=2) in vec3 color;
layout (location=3) in vec2 uv;

out struct VertOutput
{
	vec3 frag_pos;
	vec3 normal;
	vec3 color;
	vec2 uv;
} vert_output;

uniform mat4 camera_mvp;
uniform mat4 camera_model;
uniform mat4 camera_model_inv;

void main()
{
	vert_output.frag_pos = vec3(camera_model_inv * vec4(position, 1.0f));
	vert_output.normal = mat3(camera_model) * normal;
	vert_output.color = color;
	vert_output.uv = uv;
	gl_Position = camera_mvp * vec4(position, 1.0f);
}
