#pragma once
#include <iostream>
#include <format>
#include <string>
#include <vector>
#include <map>
#include <ranges>
#include <numeric>
#include <algorithm>
#include <fstream>
#include <sstream>
#include <optional>
#include <string_view>

#include <tl/expected.hpp>
#include <flecs.h>

#include <glad/glad.h>
#include <GLFW/glfw3.h>

#include <glm/common.hpp>
#include <glm/glm.hpp>
#include <glm/gtx/quaternion.hpp>
#include <glm/gtc/type_ptr.hpp>
#include <glm/gtx/string_cast.hpp>
#include <glm/gtx/vec_swizzle.hpp>

#include <msdfgen/msdfgen.h>
#include <msdfgen/msdfgen-ext.h>

#include "Application.h"
