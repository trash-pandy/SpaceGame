#include "Engine/Engine.h"

flecs::world* engi::get_registry()
{
	static flecs::world world;
	return &world;
}
