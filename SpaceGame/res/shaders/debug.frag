#version 450 core

in struct VertOutput
{
	vec3 frag_pos;
	vec3 normal;
	vec3 color;
	vec2 uv;
} vert_output;

layout (location = 0) out vec4 frag_color;

uniform vec3 camera_pos;

void main()
{

	const float ambient_strength = 0.5;
	const vec3 light_color = vec3(1, 1, 1);
	vec3 ambient = ambient_strength * light_color;

	vec3 norm = normalize(vert_output.normal);
	vec3 light_dir = normalize(vec3(1, 2, 1));
	vec3 diffuse = max(dot(norm, light_dir), 0.0) * light_color;

	float specular_strength = 0.5;
	vec3 view_dir = normalize(camera_pos - vert_output.frag_pos);
	vec3 reflect_dir = reflect(-light_dir, norm);
	float spec = pow(max(dot(view_dir, reflect_dir), 0.0), 32);
	vec3 specular = specular_strength * spec * light_color;

	vec3 result = (ambient + diffuse + specular) * vert_output.color.rgb;
	frag_color = vec4(result, 1.0);
}
