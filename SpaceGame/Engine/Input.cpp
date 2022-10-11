#include "Engine/Input.h"

using namespace engi::input;

namespace
{
	std::map<int, Key> used_keys;
}

void engi::input::update(GLFWwindow* window)
{
	for (auto& [key, def] : used_keys)
	{
		def.was_down = def.is_down;
		def.is_down = glfwGetKey(window, key);
	}
}

Key& engi::input::get_key(int key)
{
	return used_keys[key];
}

bool engi::input::is_pressed(int key)
{
	auto [is_down, was_down] = get_key(key);

	return is_down and not was_down;
}

bool engi::input::is_released(int key)
{
	auto [is_down, was_down] = get_key(key);

	return was_down and not is_down;
}

int engi::input::map_key(int key_positive, int key_negative)
{
	const auto pos = get_key(key_positive).is_down ? 1 : 0;
	const auto neg = get_key(key_negative).is_down ? -1 : 0;
	return pos + neg;
}
