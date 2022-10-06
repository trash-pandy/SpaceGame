#pragma once

#include "Common.h"
#include "Engine/Rendering/Renderer.h"

#include <assimp/Importer.hpp>
#include <assimp/scene.h>

namespace promise
{
	class Mesh
	{
	public:
		explicit Mesh(std::vector<renderer::Vertex> vertices)
		{
			using namespace renderer;

			n_vertices = vertices.size();

			glCreateVertexArrays(1, &vao);
			glCreateBuffers(1, &vbo);
			
			glVertexArrayVertexBuffer(vao, 0, vbo, 0, sizeof(Vertex));
			glVertexArrayBindingDivisor(vao, 0, 0);
			
			glEnableVertexArrayAttrib(vao, 0);
			glVertexArrayAttribFormat(vao, 0, 3, GL_FLOAT, false, offsetof(Vertex, position));
			glVertexArrayAttribBinding(vao, 0, 0);
			
			glEnableVertexArrayAttrib(vao, 1);
			glVertexArrayAttribFormat(vao, 1, 3, GL_FLOAT, true, offsetof(Vertex, normal));
			glVertexArrayAttribBinding(vao, 1, 0);
			
			glEnableVertexArrayAttrib(vao, 2);
			glVertexArrayAttribFormat(vao, 2, 3, GL_FLOAT, false, offsetof(Vertex, color));
			glVertexArrayAttribBinding(vao, 2, 0);

			glEnableVertexArrayAttrib(vao, 3);
			glVertexArrayAttribFormat(vao, 3, 2, GL_FLOAT, false, offsetof(Vertex, uv));
			glVertexArrayAttribBinding(vao, 3, 0);

			glNamedBufferStorage(vbo, n_vertices * sizeof(Vertex), vertices.data(), GL_DYNAMIC_STORAGE_BIT);
		}

		~Mesh()
		{
			glDeleteBuffers(1, &vbo);
			glDeleteVertexArrays(1, &vao);
		}

		void bind() const
		{
			if (static uint32_t selected = 0; selected != vao)
			{
				glBindVertexArray(selected = vao);
			}
		}

		void draw() const
		{
			bind();
			glDrawArrays(GL_TRIANGLES, 0, n_vertices);
		}
	private:
		uint32_t vao = 0, vbo = 0;
		int n_vertices;
	};

	class Model
	{
	public:
		explicit Model(std::string_view path)
		{
			Assimp::Importer importer;
			auto scene = importer.ReadFile(path.data(), 0);
			for (unsigned i = 0; i < scene->mNumMeshes; i++)
			{
				auto mesh = scene->mMeshes[i];
				auto& name = mesh->mName;
				std::vector<renderer::Vertex> vertices(mesh->mNumVertices);
				
				for (unsigned i = 0; i < mesh->mNumVertices; i++)
				{
					vertices[i].position = *(glm::vec3*) &mesh->mVertices[i];
					vertices[i].normal = *(glm::vec3*) &mesh->mNormals[i];
				}

				meshes[std::string(name.data, name.length)] = std::make_shared<Mesh>(vertices);
			}
		}

		explicit Model(std::vector<renderer::Vertex> vertices)
		{
			meshes["**initialized-from-vertices"] = std::make_shared<Mesh>(vertices);
		}

		explicit Model(std::initializer_list<std::shared_ptr<Mesh>> in_meshes)
		{
			for (const auto& mesh : in_meshes)
			{
				meshes["**initialized-from-mesh"] = mesh;
			}
		}

		void draw() const
		{
			for (auto& mesh : meshes | std::views::values)
			{
				mesh->draw();
			}
		}

		std::map<std::string, std::shared_ptr<Mesh>> meshes;
	};

	class Actor
	{
	public:
		explicit Actor(const Model& asset)
		{
			set_model(asset);
		}

		explicit Actor(std::string_view asset)
		{
			set_model(asset);
		}

		void set_model(const Model& asset)
		{
			model = asset;
		}

		void set_model(std::string_view asset)
		{
			model = Model(asset);
		}

		void draw() const
		{
			if (model) model->draw();
		}

		[[nodiscard]]
		glm::mat4 get_model_matrix() const
		{
			const glm::mat4
				t = translate(glm::mat4(1.0f), position),
				r = mat4_cast(normalize(rotation)),
				s = scale(glm::mat4(1.0f), size);
			return t * r * s;
		}

		glm::vec3 position { 0.f, 0.f, 0.f };
		glm::quat rotation = glm::identity<glm::quat>();
		glm::vec3 size = { 1.f, 1.f, 1.f };

	private:
		std::optional<Model> model;
	};
}
