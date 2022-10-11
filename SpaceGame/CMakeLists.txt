cmake_minimum_required(VERSION 3.8)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup(TARGETS)

add_executable(SpaceGame
	"Application.cpp"
	"Common.h"
	"Engine/Engine.h"
	"Engine/Engine.cpp"
	"Engine/Rendering/Renderer.h"
	"Engine/Rendering/Renderer.cpp"
	"Components/Terrain.h"
	"Components/Terrain.cpp"
	"Engine/Rendering/Shaders.cpp"
	"Engine/Rendering/Shaders.h"
	"Application.h"
	"Engine/Models.h"
	"Engine/Models.cpp" "Engine/Input.h" "Engine/Input.cpp" "Engine/Text.h" "Engine/Text.cpp")
set_property(TARGET SpaceGame PROPERTY CXX_STANDARD 20)
target_precompile_headers(SpaceGame PRIVATE "Common.h")
target_link_libraries(SpaceGame
	PRIVATE
		CONAN_PKG::glad
		CONAN_PKG::glfw
		CONAN_PKG::flecs
		CONAN_PKG::tl-expected
		CONAN_PKG::assimp
		CONAN_PKG::glm
		CONAN_PKG::luau
		CONAN_PKG::msdfgen)
target_include_directories(SpaceGame PRIVATE "./")

file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)
add_custom_command(
	TARGET SpaceGame POST_BUILD
	COMMAND ${CMAKE_COMMAND} -E create_symlink
	${CMAKE_CURRENT_SOURCE_DIR}/res
	${CMAKE_CURRENT_BINARY_DIR}/bin/res
)
