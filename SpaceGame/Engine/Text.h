#pragma once

#include "Common.h"

namespace engi
{
	struct Bucket
	{
		unsigned texture, cur_index;
		uint64_t handle;
	};

	struct GlyphInfo
	{
		msdfgen::Shape::Bounds bounds;
		uint64_t handle;
		unsigned index;
	};

	struct GlyphVertex
	{
		glm::vec2 position;
		glm::vec2 uv;
		glm::vec3 color;
	};

	struct GlyphVertexTexture
	{
		uint64_t handle;
		unsigned index;
	};

	class FontRendererSingleton
	{
	public:
		static FontRendererSingleton& get();

		void begin(GLFWwindow* window);
		void draw(GlyphInfo* info, glm::vec2 pos, float scale = 1, glm::vec3 color = {1, 1, 1});
		void end() const;

		FontRendererSingleton(const FontRendererSingleton&) = delete;
		FontRendererSingleton(const FontRendererSingleton&&) = delete;
		auto operator=(const FontRendererSingleton&) = delete;
		auto operator=(const FontRendererSingleton&&) = delete;

	private:
		FontRendererSingleton();

		~FontRendererSingleton() = default;

		bool needs_resize = false;
		glm::vec2 fb_size{0, 0};

		unsigned vao = 0, vbo[2] = {0, 0};
		std::vector<unsigned> handles;
		std::vector<GlyphVertex> vertices{12288};
		std::vector<GlyphVertexTexture> textures{4096};
		unsigned vert_advance = 0, tex_advance = 0;
	};

	class Font
	{
	public:
		explicit Font(std::string font_file);
		Font(Font&) = delete;
		Font(Font&&) = delete;
		auto operator=(Font&) = delete;
		auto operator=(Font&&) = delete;

		~Font();

		void draw_text(GLFWwindow* window, std::wstring_view text, glm::vec2 pos, glm::vec2 max_size);

	private:
		GlyphInfo& gen_glyph(Bucket& bucket, unsigned glyph);

		Bucket& get_bucket();

		Bucket& create_bucket();
		
		std::vector<Bucket> buckets;
		std::map<unsigned, GlyphInfo> glyph_info;
		msdfgen::FreetypeHandle* freetype;
		msdfgen::FontHandle* font;
	};
}
