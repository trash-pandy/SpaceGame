#include "Engine/Text.h"

using namespace engi;

FontRendererSingleton::FontRendererSingleton()
{
	glCreateVertexArrays(1, &vao);
	glCreateBuffers(2, vbo);

	glVertexArrayVertexBuffer(vao, 0, vbo[0], 0, sizeof GlyphVertex);
	glVertexArrayVertexBuffer(vao, 1, vbo[1], 0, sizeof GlyphVertexTexture);
	glVertexArrayAttribBinding(vao, 0, 0);
	glVertexArrayBindingDivisor(vao, 1, 0);

	glEnableVertexArrayAttrib(vao, 0);
	glVertexArrayAttribFormat(vao, 0, 2, GL_FLOAT, false, offsetof(GlyphVertex, position));
	glVertexArrayAttribBinding(vao, 0, 0);

	glEnableVertexArrayAttrib(vao, 1);
	glVertexArrayAttribFormat(vao, 1, 2, GL_FLOAT, false, offsetof(GlyphVertex, uv));
	glVertexArrayAttribBinding(vao, 1, 0);

	glEnableVertexArrayAttrib(vao, 2);
	glVertexArrayAttribFormat(vao, 2, 3, GL_FLOAT, false, offsetof(GlyphVertex, color));
	glVertexArrayAttribBinding(vao, 2, 0);

	glEnableVertexArrayAttrib(vao, 3);
	glVertexArrayAttribLFormat(vao, 3, 1, GL_DOUBLE, offsetof(GlyphVertexTexture, handle));
	glVertexArrayAttribBinding(vao, 3, 1);

	glEnableVertexArrayAttrib(vao, 4);
	glVertexArrayAttribIFormat(vao, 4, 1, GL_UNSIGNED_INT, offsetof(GlyphVertexTexture, index));
	glVertexArrayAttribBinding(vao, 4, 1);

	glNamedBufferData(
		vbo[0], vertices.capacity() * sizeof GlyphVertex, vertices.data(), GL_DYNAMIC_DRAW);
	glNamedBufferData(
		vbo[1], textures.capacity() * sizeof GlyphVertexTexture, textures.data(), GL_DYNAMIC_DRAW);
}

FontRendererSingleton& FontRendererSingleton::get()
{
	static FontRendererSingleton renderer;
	return renderer;
}

void FontRendererSingleton::begin(GLFWwindow* window)
{
	handles.clear();
	vert_advance = 0;
	tex_advance = 0;

	int x, y;
	glfwGetFramebufferSize(window, &x, &y);
	fb_size.x = float(x);
	fb_size.y = float(y);
}

void FontRendererSingleton::draw(GlyphInfo* info, glm::vec2 pos, float scale, glm::vec3 color)
{
	if (vert_advance + 6 > vertices.capacity())
	{
		vertices.reserve(vertices.capacity() + 6144);
		textures.reserve(textures.capacity() + 2048);
		needs_resize = true;
	}

	auto uv_zero = 0.f;
	auto uv_one = 1.f;

	auto fb_size_y = glm::vec2 { 0, fb_size.y };
	pos *= glm::vec2 { -1, 1 };
	auto size = glm::vec2 { info->bounds.r - info->bounds.l, info->bounds.t - info->bounds.b };
	auto tex_size = glm::vec2 { 32, 32 };

	vertices[vert_advance++] = {
		.position = (fb_size_y - (pos + glm::vec2{0, 0})) / fb_size * 2.f - 1.f,
		.uv = size / tex_size * glm::vec2 {uv_zero, uv_zero}, .color = color
	};
	vertices[vert_advance++] = {
		.position = (fb_size_y - (pos + glm::vec2{size.x, 0}) * scale) / fb_size * 2.f - 1.f,
		.uv = size / tex_size * glm::vec2 {uv_one, uv_zero}, .color = color
	};
	vertices[vert_advance++] = {
		.position = (fb_size_y - (pos + glm::vec2{size.x, size.y}) * scale) / fb_size * 2.f - 1.f,
		.uv = size / tex_size * glm::vec2 {uv_one, uv_one}, .color = color
	};

	vertices[vert_advance++] = {
		.position = (fb_size_y - (pos + glm::vec2{0, 0})) / fb_size * 2.f - 1.f,
		.uv = size / tex_size * glm::vec2 {uv_zero, uv_zero}, .color = color
	};
	vertices[vert_advance++] = {
		.position = (fb_size_y - (pos + glm::vec2{size.x, size.y}) * scale) / fb_size * 2.f - 1.f,
		.uv = size / tex_size * glm::vec2 {uv_one, uv_one}, .color = color
	};
	vertices[vert_advance++] = {
		.position = (fb_size_y - (pos + glm::vec2{0, size.y}) * scale) / fb_size * 2.f - 1.f,
		.uv = size / tex_size * glm::vec2 {uv_zero, uv_one}, .color = color
	};

	textures[tex_advance++] = {.handle = info->handle, .index = info->index};
	textures[tex_advance++] = {.handle = info->handle, .index = info->index};
	//
	textures[tex_advance++] = {.handle = info->handle, .index = info->index};
	textures[tex_advance++] = {.handle = info->handle, .index = info->index};
	textures[tex_advance++] = {.handle = info->handle, .index = info->index};
	textures[tex_advance++] = {.handle = info->handle, .index = info->index};
}

void FontRendererSingleton::end() const
{
	if (needs_resize)
	{
		glNamedBufferData(
			vbo[0], vertices.capacity() * sizeof GlyphVertex, vertices.data(), GL_DYNAMIC_DRAW);
		glNamedBufferData(
			vbo[1], textures.capacity() * sizeof GlyphVertexTexture, textures.data(), GL_DYNAMIC_DRAW);
		return;
	}

	glNamedBufferSubData(vbo[0], 0, vert_advance * sizeof GlyphVertex, vertices.data());
	glNamedBufferSubData(vbo[1], 0, tex_advance * sizeof GlyphVertex, textures.data());

	glBindVertexArray(vao);
	glDrawArrays(GL_TRIANGLES, 0, vert_advance);
}

Font::Font(std::string font_file)
{
	freetype = msdfgen::initializeFreetype();
	if (freetype)
	{
		font = loadFont(freetype, font_file.c_str());
		if (font)
		{
			auto& bucket = create_bucket();
			for (unsigned i = 33; i <= 127; i++)
			{
				gen_glyph(bucket, i);
			}
		}
	}
}

Font::~Font()
{
	if (freetype) deinitializeFreetype(freetype);
	if (font) destroyFont(font);
}

void Font::draw_text(GLFWwindow* window, std::wstring_view text, glm::vec2 pos, glm::vec2 max_size)
{
	msdfgen::FontMetrics metrics{};
	double space_width, tab_width;
	getFontMetrics(metrics, font);
	getFontWhitespaceWidth(space_width, tab_width, font);

	glm::vec2 advance = pos;

	auto scale = 1;
	auto& renderer = FontRendererSingleton::get();
	for (const auto c : text)
	{
		if (c < 33)
		{
			advance.x += 16;
			continue;
		}

		auto glyph_iter = glyph_info.find(c);
		GlyphInfo* glyph;
		if (glyph_iter == std::end(glyph_info))
		{
			glyph = &gen_glyph(get_bucket(), c);
		}
		else
		{
			glyph = &glyph_iter->second;
		}

		renderer.draw(glyph, advance, scale);
		advance.x += (glyph->bounds.r - glyph->bounds.l) * scale;

		if (advance.x - pos.x > max_size.x)
		{
			advance.x = pos.x;
			advance.y += (glyph->bounds.b - glyph->bounds.t) * scale;
		}
	}
}

GlyphInfo& Font::gen_glyph(Bucket& bucket, unsigned glyph)
{
	if (msdfgen::Shape shape; loadGlyph(shape, font, glyph))
	{
		shape.normalize();
		edgeColoringSimple(shape, 3.0);

		msdfgen::Bitmap<float, 3> bitmap = {32, 32};
		generateMSDF(bitmap, shape, 4.0, 1.0, msdfgen::Vector2(4, 4));
		auto& info = glyph_info[glyph];
		info.handle = bucket.handle;
		info.index = bucket.cur_index;
		info.bounds = shape.getBounds();
		glTextureSubImage3D(bucket.texture, 0, 0, 0, bucket.cur_index++, 32, 32, 1, GL_RGB, GL_FLOAT,
			bitmap(0, 0));

		return info;
	}
	throw std::exception("Failed to generate glyph");
}

Bucket& Font::get_bucket()
{
	auto& bucket = buckets.back();
	if (bucket.cur_index >= 2048)
	{
		return create_bucket();
	}
	return bucket;
}

Bucket& Font::create_bucket()
{
	auto& bucket = buckets.emplace_back();
	glCreateTextures(GL_TEXTURE_2D_ARRAY, 1, &bucket.texture);
	glTextureStorage3D(bucket.texture, 1, GL_RGB32F, 32, 32, 2048);
	glTextureParameteri(bucket.texture, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTextureParameteri(bucket.texture, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	glTextureParameteri(bucket.texture, GL_TEXTURE_WRAP_S, GL_REPEAT);
	glTextureParameteri(bucket.texture, GL_TEXTURE_WRAP_T, GL_REPEAT);
	bucket.handle = glGetTextureHandleARB(bucket.texture);
	glMakeTextureHandleResidentARB(bucket.handle);
	return bucket;
}
