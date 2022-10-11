#version 450 core
#extension GL_ARB_gpu_shader_int64 : require

layout (location = 0) in vec2 in_pos;
layout (location = 1) in vec2 in_uv;
layout (location = 2) in vec3 in_color;

layout (location = 3) in uint64_t in_texture;
layout (location = 4) in uint64_t in_index;

out struct VSOut
{
	vec2 uv;
	vec3 color;
} vs_out;

out flat uint64_t fs_texture;
out flat uint64_t fs_index;

void main()
{
	gl_Position = vec4(in_pos, 0, 1);
	vs_out.uv = in_uv;
	vs_out.color = in_color;
	fs_texture = in_texture;
	fs_index = in_index;
}
