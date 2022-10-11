#pragma once

#include "Common.h"

namespace engi::input
{
	struct Key
	{
		bool is_down, was_down;
	};

	void update(GLFWwindow* window);

	Key& get_key(int key);

	bool is_pressed(int key);
	bool is_released(int key);

	int map_key(int key_positive, int key_negative);
}
