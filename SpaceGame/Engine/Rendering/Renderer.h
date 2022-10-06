#pragma once

#include "Common.h"

namespace promise::renderer
{
	struct Vertex
	{
		glm::vec3 position = { 0.f, 0.f, 0.f };
		glm::vec3 normal = { 1.f, 0.f, 0.f };
		glm::vec3 color = { 0.46f, 0.42f, 0.54f };
		glm::vec2 uv = { 0.f, 0.f };
	};

	struct DrawMeta
	{
		glm::vec3 instance_pos;
	};

	struct Mesh
	{
		size_t start, length;
	};

	struct DrawCommand
	{
	};

	Mesh* create_mesh(std::vector<Vertex> in_vertices);

	void clear();

	void draw(Mesh* mesh, DrawCommand command);

	void submit();
}
