#version 450 core
#extension GL_ARB_gpu_shader_int64 : require
#extension GL_EXT_texture_array : require

in struct VSOut
{
	vec2 uv;
	vec3 color;
} vs_out;

in flat uint64_t fs_texture;
in flat uint64_t fs_index;

layout (location = 0) out vec4 color;

float pxRange = 4.0; // set to distance field's pixel range
float txSize = 32;
float scale = 1;

float screenPxRange() {
    return 4;
}

float median(float r, float g, float b)
{
    return max(min(r, g), min(max(r, g), b));
}

void main()
{
    vec3 msd = texture2DArray(sampler2DArray(fs_texture), vec3(vs_out.uv, fs_index)).rgb;
    float sd = median(msd.r, msd.g, msd.b);
    float screenPxDistance = screenPxRange()*(sd - 0.5);
    float opacity = clamp(screenPxDistance + 0.5, 0.0, 1.0);
    if (opacity < 0.01) discard;
    color = vec4(vs_out.color, opacity);
}
