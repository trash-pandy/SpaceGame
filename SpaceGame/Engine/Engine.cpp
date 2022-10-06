#include "Engine/Engine.h"

flecs::world* promise::get_registry()
{
	static flecs::world world;
	return &world;
}
