#pragma once

#include "Common.h"

namespace engi
{
	class ShaderUniform
	{
	public:
		ShaderUniform(uint32_t in_program, const char* name);
		ShaderUniform(uint32_t in_program, int in_location);

		ShaderUniform(const ShaderUniform&) = delete;
		ShaderUniform(const ShaderUniform&&) = delete;

		ShaderUniform& operator=(const glm::mat4& value);

		ShaderUniform& operator=(const glm::vec3& value);

	private:
		uint32_t program;
		int location;
	};

	class ShaderPipeline
	{
	public:
		std::optional<std::string> add_shader(std::string file, GLenum shader_type) noexcept;

		void link();
		void use() const;

		ShaderUniform& operator[](const char* uniform);
	private:
		std::map<std::string, ShaderUniform> uniforms;
		uint32_t shaders[4] = {}, program = 0;
		uint8_t length = 0;
	};
}
