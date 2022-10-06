#include "Engine/Rendering/Renderer.h"

using namespace promise::renderer;

namespace
{
	std::vector<Vertex> vertices;
	std::vector<Mesh> allocated_meshes;
	std::vector<DrawCommand> command_list;
}

Mesh* promise::renderer::create_mesh(std::vector<Vertex> in_vertices)
{
	const auto start = vertices.size();
	if (start + in_vertices.size() > vertices.capacity())
	{
		size_t new_capacity = start + in_vertices.size() + 4096;
		new_capacity -= new_capacity % 4096;
		vertices.reserve(new_capacity);
	}
	std::ranges::copy(in_vertices, std::back_inserter(vertices));
	const auto end = vertices.size();
	return &allocated_meshes.emplace_back(start, end - start);
}

void promise::renderer::clear()
{
}

void promise::renderer::draw(Mesh* mesh, DrawCommand command)
{
}

void promise::renderer::submit()
{
}
