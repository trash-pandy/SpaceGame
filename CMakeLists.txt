cmake_minimum_required(VERSION 3.8)
set(CMAKE_CXX_STANDARD 20)
project("SpaceGame" CXX)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_BINARY_DIR})
list(APPEND CMAKE_PREFIX_PATH ${CMAKE_BINARY_DIR})

if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
  message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
  file(DOWNLOAD "https://raw.githubusercontent.com/conan-io/cmake-conan/0.18.1/conan.cmake"
                "${CMAKE_BINARY_DIR}/conan.cmake"
                TLS_VERIFY ON)
endif()

include(${CMAKE_BINARY_DIR}/conan.cmake)

conan_cmake_configure(
    REQUIRES
        glad/0.1.36
        glfw/3.3.8
        flecs/3.0.4
        tl-expected/20190710
        assimp/5.2.2
        glm/cci.20220420
        luau/0.544
    OPTIONS
        glad:gl_profile=core
        glad:gl_version=4.5
    GENERATORS
        cmake)

conan_cmake_autodetect(settings BUILD_TYPE ${CMAKE_BUILD_TYPE})
conan_cmake_install(
    PATH_OR_REFERENCE .
    BUILD missing
    REMOTE conancenter
    SETTINGS ${settings})

add_subdirectory("SpaceGame")
