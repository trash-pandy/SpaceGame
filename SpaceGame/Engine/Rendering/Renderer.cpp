#include "Engine/Rendering/Renderer.h"

using namespace engi::renderer;

namespace
{
	std::vector<Vertex> vertices;
	std::vector<Mesh> allocated_meshes;
	std::vector<DrawCommand> command_list;
}

Mesh* engi::renderer::create_mesh(std::vector<Vertex> in_vertices)
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

void engi::renderer::clear()
{
}

void engi::renderer::draw(Mesh* mesh, DrawCommand command)
{
}

void engi::renderer::submit()
{
}
