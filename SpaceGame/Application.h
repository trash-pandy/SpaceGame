#pragma once

#include <tl/expected.hpp>

tl::expected<std::string, std::string> read_file(const std::string& filename);
