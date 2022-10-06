include(CMakeParseArguments)

macro(conan_find_apple_frameworks FRAMEWORKS_FOUND FRAMEWORKS SUFFIX BUILD_TYPE)
    if(APPLE)
        if(CMAKE_BUILD_TYPE)
            set(_BTYPE ${CMAKE_BUILD_TYPE})
        elseif(NOT BUILD_TYPE STREQUAL "")
            set(_BTYPE ${BUILD_TYPE})
        endif()
        if(_BTYPE)
            if(${_BTYPE} MATCHES "Debug|_DEBUG")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_DEBUG} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_DEBUG} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            elseif(${_BTYPE} MATCHES "Release|_RELEASE")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_RELEASE} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_RELEASE} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            elseif(${_BTYPE} MATCHES "RelWithDebInfo|_RELWITHDEBINFO")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_RELWITHDEBINFO} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_RELWITHDEBINFO} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            elseif(${_BTYPE} MATCHES "MinSizeRel|_MINSIZEREL")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_MINSIZEREL} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_MINSIZEREL} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            endif()
        endif()
        foreach(_FRAMEWORK ${FRAMEWORKS})
            # https://cmake.org/pipermail/cmake-developers/2017-August/030199.html
            find_library(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND NAMES ${_FRAMEWORK} PATHS ${CONAN_FRAMEWORK_DIRS${SUFFIX}} CMAKE_FIND_ROOT_PATH_BOTH)
            if(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND)
                list(APPEND ${FRAMEWORKS_FOUND} ${CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND})
            else()
                message(FATAL_ERROR "Framework library ${_FRAMEWORK} not found in paths: ${CONAN_FRAMEWORK_DIRS${SUFFIX}}")
            endif()
        endforeach()
    endif()
endmacro()


#################
###  GLAD
#################
set(CONAN_GLAD_ROOT "C:/Users/evan_/.conan/data/glad/0.1.36/_/_/package/78d45823d59453237bf9c9a6030a8ea718d81ca0")
set(CONAN_INCLUDE_DIRS_GLAD "C:/Users/evan_/.conan/data/glad/0.1.36/_/_/package/78d45823d59453237bf9c9a6030a8ea718d81ca0/include")
set(CONAN_LIB_DIRS_GLAD "C:/Users/evan_/.conan/data/glad/0.1.36/_/_/package/78d45823d59453237bf9c9a6030a8ea718d81ca0/lib")
set(CONAN_BIN_DIRS_GLAD )
set(CONAN_RES_DIRS_GLAD )
set(CONAN_SRC_DIRS_GLAD )
set(CONAN_BUILD_DIRS_GLAD "C:/Users/evan_/.conan/data/glad/0.1.36/_/_/package/78d45823d59453237bf9c9a6030a8ea718d81ca0/")
set(CONAN_FRAMEWORK_DIRS_GLAD )
set(CONAN_LIBS_GLAD glad)
set(CONAN_PKG_LIBS_GLAD glad)
set(CONAN_SYSTEM_LIBS_GLAD )
set(CONAN_FRAMEWORKS_GLAD )
set(CONAN_FRAMEWORKS_FOUND_GLAD "")  # Will be filled later
set(CONAN_DEFINES_GLAD )
set(CONAN_BUILD_MODULES_PATHS_GLAD )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_GLAD )

set(CONAN_C_FLAGS_GLAD "")
set(CONAN_CXX_FLAGS_GLAD "")
set(CONAN_SHARED_LINKER_FLAGS_GLAD "")
set(CONAN_EXE_LINKER_FLAGS_GLAD "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_GLAD_LIST "")
set(CONAN_CXX_FLAGS_GLAD_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_GLAD_LIST "")
set(CONAN_EXE_LINKER_FLAGS_GLAD_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_GLAD "${CONAN_FRAMEWORKS_GLAD}" "_GLAD" "")
# Append to aggregated values variable
set(CONAN_LIBS_GLAD ${CONAN_PKG_LIBS_GLAD} ${CONAN_SYSTEM_LIBS_GLAD} ${CONAN_FRAMEWORKS_FOUND_GLAD})


#################
###  GLFW
#################
set(CONAN_GLFW_ROOT "C:/Users/evan_/.conan/data/glfw/3.3.8/_/_/package/d2bbd56c1f653d6cd1a2bcf499dd79bd0a930b61")
set(CONAN_INCLUDE_DIRS_GLFW "C:/Users/evan_/.conan/data/glfw/3.3.8/_/_/package/d2bbd56c1f653d6cd1a2bcf499dd79bd0a930b61/include")
set(CONAN_LIB_DIRS_GLFW "C:/Users/evan_/.conan/data/glfw/3.3.8/_/_/package/d2bbd56c1f653d6cd1a2bcf499dd79bd0a930b61/lib")
set(CONAN_BIN_DIRS_GLFW )
set(CONAN_RES_DIRS_GLFW )
set(CONAN_SRC_DIRS_GLFW )
set(CONAN_BUILD_DIRS_GLFW "C:/Users/evan_/.conan/data/glfw/3.3.8/_/_/package/d2bbd56c1f653d6cd1a2bcf499dd79bd0a930b61/")
set(CONAN_FRAMEWORK_DIRS_GLFW )
set(CONAN_LIBS_GLFW glfw3)
set(CONAN_PKG_LIBS_GLFW glfw3)
set(CONAN_SYSTEM_LIBS_GLFW gdi32)
set(CONAN_FRAMEWORKS_GLFW )
set(CONAN_FRAMEWORKS_FOUND_GLFW "")  # Will be filled later
set(CONAN_DEFINES_GLFW )
set(CONAN_BUILD_MODULES_PATHS_GLFW )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_GLFW )

set(CONAN_C_FLAGS_GLFW "")
set(CONAN_CXX_FLAGS_GLFW "")
set(CONAN_SHARED_LINKER_FLAGS_GLFW "")
set(CONAN_EXE_LINKER_FLAGS_GLFW "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_GLFW_LIST "")
set(CONAN_CXX_FLAGS_GLFW_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_GLFW_LIST "")
set(CONAN_EXE_LINKER_FLAGS_GLFW_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_GLFW "${CONAN_FRAMEWORKS_GLFW}" "_GLFW" "")
# Append to aggregated values variable
set(CONAN_LIBS_GLFW ${CONAN_PKG_LIBS_GLFW} ${CONAN_SYSTEM_LIBS_GLFW} ${CONAN_FRAMEWORKS_FOUND_GLFW})


#################
###  FLECS
#################
set(CONAN_FLECS_ROOT "C:/Users/evan_/.conan/data/flecs/3.0.4/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b")
set(CONAN_INCLUDE_DIRS_FLECS "C:/Users/evan_/.conan/data/flecs/3.0.4/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/include")
set(CONAN_LIB_DIRS_FLECS "C:/Users/evan_/.conan/data/flecs/3.0.4/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/lib")
set(CONAN_BIN_DIRS_FLECS "C:/Users/evan_/.conan/data/flecs/3.0.4/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/bin")
set(CONAN_RES_DIRS_FLECS )
set(CONAN_SRC_DIRS_FLECS )
set(CONAN_BUILD_DIRS_FLECS )
set(CONAN_FRAMEWORK_DIRS_FLECS )
set(CONAN_LIBS_FLECS flecs_static)
set(CONAN_PKG_LIBS_FLECS flecs_static)
set(CONAN_SYSTEM_LIBS_FLECS wsock32 ws2_32)
set(CONAN_FRAMEWORKS_FLECS )
set(CONAN_FRAMEWORKS_FOUND_FLECS "")  # Will be filled later
set(CONAN_DEFINES_FLECS "-Dflecs_STATIC")
set(CONAN_BUILD_MODULES_PATHS_FLECS )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_FLECS "flecs_STATIC")

set(CONAN_C_FLAGS_FLECS "")
set(CONAN_CXX_FLAGS_FLECS "")
set(CONAN_SHARED_LINKER_FLAGS_FLECS "")
set(CONAN_EXE_LINKER_FLAGS_FLECS "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_FLECS_LIST "")
set(CONAN_CXX_FLAGS_FLECS_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_FLECS_LIST "")
set(CONAN_EXE_LINKER_FLAGS_FLECS_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_FLECS "${CONAN_FRAMEWORKS_FLECS}" "_FLECS" "")
# Append to aggregated values variable
set(CONAN_LIBS_FLECS ${CONAN_PKG_LIBS_FLECS} ${CONAN_SYSTEM_LIBS_FLECS} ${CONAN_FRAMEWORKS_FOUND_FLECS})


#################
###  TL-EXPECTED
#################
set(CONAN_TL-EXPECTED_ROOT "C:/Users/evan_/.conan/data/tl-expected/20190710/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_TL-EXPECTED "C:/Users/evan_/.conan/data/tl-expected/20190710/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include")
set(CONAN_LIB_DIRS_TL-EXPECTED )
set(CONAN_BIN_DIRS_TL-EXPECTED )
set(CONAN_RES_DIRS_TL-EXPECTED )
set(CONAN_SRC_DIRS_TL-EXPECTED )
set(CONAN_BUILD_DIRS_TL-EXPECTED )
set(CONAN_FRAMEWORK_DIRS_TL-EXPECTED )
set(CONAN_LIBS_TL-EXPECTED )
set(CONAN_PKG_LIBS_TL-EXPECTED )
set(CONAN_SYSTEM_LIBS_TL-EXPECTED )
set(CONAN_FRAMEWORKS_TL-EXPECTED )
set(CONAN_FRAMEWORKS_FOUND_TL-EXPECTED "")  # Will be filled later
set(CONAN_DEFINES_TL-EXPECTED )
set(CONAN_BUILD_MODULES_PATHS_TL-EXPECTED )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_TL-EXPECTED )

set(CONAN_C_FLAGS_TL-EXPECTED "")
set(CONAN_CXX_FLAGS_TL-EXPECTED "")
set(CONAN_SHARED_LINKER_FLAGS_TL-EXPECTED "")
set(CONAN_EXE_LINKER_FLAGS_TL-EXPECTED "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_TL-EXPECTED_LIST "")
set(CONAN_CXX_FLAGS_TL-EXPECTED_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_TL-EXPECTED_LIST "")
set(CONAN_EXE_LINKER_FLAGS_TL-EXPECTED_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_TL-EXPECTED "${CONAN_FRAMEWORKS_TL-EXPECTED}" "_TL-EXPECTED" "")
# Append to aggregated values variable
set(CONAN_LIBS_TL-EXPECTED ${CONAN_PKG_LIBS_TL-EXPECTED} ${CONAN_SYSTEM_LIBS_TL-EXPECTED} ${CONAN_FRAMEWORKS_FOUND_TL-EXPECTED})


#################
###  ASSIMP
#################
set(CONAN_ASSIMP_ROOT "C:/Users/evan_/.conan/data/assimp/5.2.2/_/_/package/1850bc4ebd4615802a8c0c936c43e59647dd7771")
set(CONAN_INCLUDE_DIRS_ASSIMP "C:/Users/evan_/.conan/data/assimp/5.2.2/_/_/package/1850bc4ebd4615802a8c0c936c43e59647dd7771/include")
set(CONAN_LIB_DIRS_ASSIMP "C:/Users/evan_/.conan/data/assimp/5.2.2/_/_/package/1850bc4ebd4615802a8c0c936c43e59647dd7771/lib")
set(CONAN_BIN_DIRS_ASSIMP )
set(CONAN_RES_DIRS_ASSIMP )
set(CONAN_SRC_DIRS_ASSIMP )
set(CONAN_BUILD_DIRS_ASSIMP "C:/Users/evan_/.conan/data/assimp/5.2.2/_/_/package/1850bc4ebd4615802a8c0c936c43e59647dd7771/")
set(CONAN_FRAMEWORK_DIRS_ASSIMP )
set(CONAN_LIBS_ASSIMP assimp-vc143-mt)
set(CONAN_PKG_LIBS_ASSIMP assimp-vc143-mt)
set(CONAN_SYSTEM_LIBS_ASSIMP )
set(CONAN_FRAMEWORKS_ASSIMP )
set(CONAN_FRAMEWORKS_FOUND_ASSIMP "")  # Will be filled later
set(CONAN_DEFINES_ASSIMP )
set(CONAN_BUILD_MODULES_PATHS_ASSIMP )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_ASSIMP )

set(CONAN_C_FLAGS_ASSIMP "")
set(CONAN_CXX_FLAGS_ASSIMP "")
set(CONAN_SHARED_LINKER_FLAGS_ASSIMP "")
set(CONAN_EXE_LINKER_FLAGS_ASSIMP "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_ASSIMP_LIST "")
set(CONAN_CXX_FLAGS_ASSIMP_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_ASSIMP_LIST "")
set(CONAN_EXE_LINKER_FLAGS_ASSIMP_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_ASSIMP "${CONAN_FRAMEWORKS_ASSIMP}" "_ASSIMP" "")
# Append to aggregated values variable
set(CONAN_LIBS_ASSIMP ${CONAN_PKG_LIBS_ASSIMP} ${CONAN_SYSTEM_LIBS_ASSIMP} ${CONAN_FRAMEWORKS_FOUND_ASSIMP})


#################
###  GLM
#################
set(CONAN_GLM_ROOT "C:/Users/evan_/.conan/data/glm/cci.20220420/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_GLM "C:/Users/evan_/.conan/data/glm/cci.20220420/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include")
set(CONAN_LIB_DIRS_GLM )
set(CONAN_BIN_DIRS_GLM )
set(CONAN_RES_DIRS_GLM )
set(CONAN_SRC_DIRS_GLM )
set(CONAN_BUILD_DIRS_GLM "C:/Users/evan_/.conan/data/glm/cci.20220420/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_GLM )
set(CONAN_LIBS_GLM )
set(CONAN_PKG_LIBS_GLM )
set(CONAN_SYSTEM_LIBS_GLM )
set(CONAN_FRAMEWORKS_GLM )
set(CONAN_FRAMEWORKS_FOUND_GLM "")  # Will be filled later
set(CONAN_DEFINES_GLM )
set(CONAN_BUILD_MODULES_PATHS_GLM )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_GLM )

set(CONAN_C_FLAGS_GLM "")
set(CONAN_CXX_FLAGS_GLM "")
set(CONAN_SHARED_LINKER_FLAGS_GLM "")
set(CONAN_EXE_LINKER_FLAGS_GLM "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_GLM_LIST "")
set(CONAN_CXX_FLAGS_GLM_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_GLM_LIST "")
set(CONAN_EXE_LINKER_FLAGS_GLM_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_GLM "${CONAN_FRAMEWORKS_GLM}" "_GLM" "")
# Append to aggregated values variable
set(CONAN_LIBS_GLM ${CONAN_PKG_LIBS_GLM} ${CONAN_SYSTEM_LIBS_GLM} ${CONAN_FRAMEWORKS_FOUND_GLM})


#################
###  LUAU
#################
set(CONAN_LUAU_ROOT "C:/Users/evan_/.conan/data/luau/0.544/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f")
set(CONAN_INCLUDE_DIRS_LUAU "C:/Users/evan_/.conan/data/luau/0.544/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f/include")
set(CONAN_LIB_DIRS_LUAU "C:/Users/evan_/.conan/data/luau/0.544/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f/lib")
set(CONAN_BIN_DIRS_LUAU )
set(CONAN_RES_DIRS_LUAU )
set(CONAN_SRC_DIRS_LUAU )
set(CONAN_BUILD_DIRS_LUAU "C:/Users/evan_/.conan/data/luau/0.544/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f/")
set(CONAN_FRAMEWORK_DIRS_LUAU )
set(CONAN_LIBS_LUAU Luau.VM Luau.Analysis Luau.Compiler Luau.CodeGen Luau.Ast)
set(CONAN_PKG_LIBS_LUAU Luau.VM Luau.Analysis Luau.Compiler Luau.CodeGen Luau.Ast)
set(CONAN_SYSTEM_LIBS_LUAU )
set(CONAN_FRAMEWORKS_LUAU )
set(CONAN_FRAMEWORKS_FOUND_LUAU "")  # Will be filled later
set(CONAN_DEFINES_LUAU )
set(CONAN_BUILD_MODULES_PATHS_LUAU )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LUAU )

set(CONAN_C_FLAGS_LUAU "")
set(CONAN_CXX_FLAGS_LUAU "")
set(CONAN_SHARED_LINKER_FLAGS_LUAU "")
set(CONAN_EXE_LINKER_FLAGS_LUAU "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LUAU_LIST "")
set(CONAN_CXX_FLAGS_LUAU_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LUAU_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LUAU_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LUAU "${CONAN_FRAMEWORKS_LUAU}" "_LUAU" "")
# Append to aggregated values variable
set(CONAN_LIBS_LUAU ${CONAN_PKG_LIBS_LUAU} ${CONAN_SYSTEM_LIBS_LUAU} ${CONAN_FRAMEWORKS_FOUND_LUAU})


#################
###  OPENGL
#################
set(CONAN_OPENGL_ROOT "C:/Users/evan_/.conan/data/opengl/system/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_OPENGL )
set(CONAN_LIB_DIRS_OPENGL )
set(CONAN_BIN_DIRS_OPENGL )
set(CONAN_RES_DIRS_OPENGL )
set(CONAN_SRC_DIRS_OPENGL )
set(CONAN_BUILD_DIRS_OPENGL "C:/Users/evan_/.conan/data/opengl/system/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_OPENGL )
set(CONAN_LIBS_OPENGL )
set(CONAN_PKG_LIBS_OPENGL )
set(CONAN_SYSTEM_LIBS_OPENGL opengl32)
set(CONAN_FRAMEWORKS_OPENGL )
set(CONAN_FRAMEWORKS_FOUND_OPENGL "")  # Will be filled later
set(CONAN_DEFINES_OPENGL )
set(CONAN_BUILD_MODULES_PATHS_OPENGL )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_OPENGL )

set(CONAN_C_FLAGS_OPENGL "")
set(CONAN_CXX_FLAGS_OPENGL "")
set(CONAN_SHARED_LINKER_FLAGS_OPENGL "")
set(CONAN_EXE_LINKER_FLAGS_OPENGL "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_OPENGL_LIST "")
set(CONAN_CXX_FLAGS_OPENGL_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_OPENGL_LIST "")
set(CONAN_EXE_LINKER_FLAGS_OPENGL_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_OPENGL "${CONAN_FRAMEWORKS_OPENGL}" "_OPENGL" "")
# Append to aggregated values variable
set(CONAN_LIBS_OPENGL ${CONAN_PKG_LIBS_OPENGL} ${CONAN_SYSTEM_LIBS_OPENGL} ${CONAN_FRAMEWORKS_FOUND_OPENGL})


#################
###  MINIZIP
#################
set(CONAN_MINIZIP_ROOT "C:/Users/evan_/.conan/data/minizip/1.2.12/_/_/package/4835c5fd5db705679d749d756c4af2beb7d8773c")
set(CONAN_INCLUDE_DIRS_MINIZIP "C:/Users/evan_/.conan/data/minizip/1.2.12/_/_/package/4835c5fd5db705679d749d756c4af2beb7d8773c/include"
			"C:/Users/evan_/.conan/data/minizip/1.2.12/_/_/package/4835c5fd5db705679d749d756c4af2beb7d8773c/include/minizip")
set(CONAN_LIB_DIRS_MINIZIP "C:/Users/evan_/.conan/data/minizip/1.2.12/_/_/package/4835c5fd5db705679d749d756c4af2beb7d8773c/lib")
set(CONAN_BIN_DIRS_MINIZIP )
set(CONAN_RES_DIRS_MINIZIP )
set(CONAN_SRC_DIRS_MINIZIP )
set(CONAN_BUILD_DIRS_MINIZIP "C:/Users/evan_/.conan/data/minizip/1.2.12/_/_/package/4835c5fd5db705679d749d756c4af2beb7d8773c/")
set(CONAN_FRAMEWORK_DIRS_MINIZIP )
set(CONAN_LIBS_MINIZIP minizip)
set(CONAN_PKG_LIBS_MINIZIP minizip)
set(CONAN_SYSTEM_LIBS_MINIZIP )
set(CONAN_FRAMEWORKS_MINIZIP )
set(CONAN_FRAMEWORKS_FOUND_MINIZIP "")  # Will be filled later
set(CONAN_DEFINES_MINIZIP "-DHAVE_BZIP2")
set(CONAN_BUILD_MODULES_PATHS_MINIZIP )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_MINIZIP "HAVE_BZIP2")

set(CONAN_C_FLAGS_MINIZIP "")
set(CONAN_CXX_FLAGS_MINIZIP "")
set(CONAN_SHARED_LINKER_FLAGS_MINIZIP "")
set(CONAN_EXE_LINKER_FLAGS_MINIZIP "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_MINIZIP_LIST "")
set(CONAN_CXX_FLAGS_MINIZIP_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_MINIZIP_LIST "")
set(CONAN_EXE_LINKER_FLAGS_MINIZIP_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_MINIZIP "${CONAN_FRAMEWORKS_MINIZIP}" "_MINIZIP" "")
# Append to aggregated values variable
set(CONAN_LIBS_MINIZIP ${CONAN_PKG_LIBS_MINIZIP} ${CONAN_SYSTEM_LIBS_MINIZIP} ${CONAN_FRAMEWORKS_FOUND_MINIZIP})


#################
###  UTFCPP
#################
set(CONAN_UTFCPP_ROOT "C:/Users/evan_/.conan/data/utfcpp/3.2.1/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_UTFCPP "C:/Users/evan_/.conan/data/utfcpp/3.2.1/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include"
			"C:/Users/evan_/.conan/data/utfcpp/3.2.1/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include/utf8cpp")
set(CONAN_LIB_DIRS_UTFCPP )
set(CONAN_BIN_DIRS_UTFCPP )
set(CONAN_RES_DIRS_UTFCPP )
set(CONAN_SRC_DIRS_UTFCPP )
set(CONAN_BUILD_DIRS_UTFCPP "C:/Users/evan_/.conan/data/utfcpp/3.2.1/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_UTFCPP )
set(CONAN_LIBS_UTFCPP )
set(CONAN_PKG_LIBS_UTFCPP )
set(CONAN_SYSTEM_LIBS_UTFCPP )
set(CONAN_FRAMEWORKS_UTFCPP )
set(CONAN_FRAMEWORKS_FOUND_UTFCPP "")  # Will be filled later
set(CONAN_DEFINES_UTFCPP )
set(CONAN_BUILD_MODULES_PATHS_UTFCPP )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_UTFCPP )

set(CONAN_C_FLAGS_UTFCPP "")
set(CONAN_CXX_FLAGS_UTFCPP "")
set(CONAN_SHARED_LINKER_FLAGS_UTFCPP "")
set(CONAN_EXE_LINKER_FLAGS_UTFCPP "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_UTFCPP_LIST "")
set(CONAN_CXX_FLAGS_UTFCPP_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_UTFCPP_LIST "")
set(CONAN_EXE_LINKER_FLAGS_UTFCPP_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_UTFCPP "${CONAN_FRAMEWORKS_UTFCPP}" "_UTFCPP" "")
# Append to aggregated values variable
set(CONAN_LIBS_UTFCPP ${CONAN_PKG_LIBS_UTFCPP} ${CONAN_SYSTEM_LIBS_UTFCPP} ${CONAN_FRAMEWORKS_FOUND_UTFCPP})


#################
###  PUGIXML
#################
set(CONAN_PUGIXML_ROOT "C:/Users/evan_/.conan/data/pugixml/1.12.1/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f")
set(CONAN_INCLUDE_DIRS_PUGIXML "C:/Users/evan_/.conan/data/pugixml/1.12.1/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f/include")
set(CONAN_LIB_DIRS_PUGIXML "C:/Users/evan_/.conan/data/pugixml/1.12.1/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f/lib")
set(CONAN_BIN_DIRS_PUGIXML )
set(CONAN_RES_DIRS_PUGIXML )
set(CONAN_SRC_DIRS_PUGIXML )
set(CONAN_BUILD_DIRS_PUGIXML "C:/Users/evan_/.conan/data/pugixml/1.12.1/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f/")
set(CONAN_FRAMEWORK_DIRS_PUGIXML )
set(CONAN_LIBS_PUGIXML pugixml)
set(CONAN_PKG_LIBS_PUGIXML pugixml)
set(CONAN_SYSTEM_LIBS_PUGIXML )
set(CONAN_FRAMEWORKS_PUGIXML )
set(CONAN_FRAMEWORKS_FOUND_PUGIXML "")  # Will be filled later
set(CONAN_DEFINES_PUGIXML )
set(CONAN_BUILD_MODULES_PATHS_PUGIXML )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_PUGIXML )

set(CONAN_C_FLAGS_PUGIXML "")
set(CONAN_CXX_FLAGS_PUGIXML "")
set(CONAN_SHARED_LINKER_FLAGS_PUGIXML "")
set(CONAN_EXE_LINKER_FLAGS_PUGIXML "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_PUGIXML_LIST "")
set(CONAN_CXX_FLAGS_PUGIXML_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_PUGIXML_LIST "")
set(CONAN_EXE_LINKER_FLAGS_PUGIXML_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_PUGIXML "${CONAN_FRAMEWORKS_PUGIXML}" "_PUGIXML" "")
# Append to aggregated values variable
set(CONAN_LIBS_PUGIXML ${CONAN_PKG_LIBS_PUGIXML} ${CONAN_SYSTEM_LIBS_PUGIXML} ${CONAN_FRAMEWORKS_FOUND_PUGIXML})


#################
###  KUBA-ZIP
#################
set(CONAN_KUBA-ZIP_ROOT "C:/Users/evan_/.conan/data/kuba-zip/0.2.4/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b")
set(CONAN_INCLUDE_DIRS_KUBA-ZIP "C:/Users/evan_/.conan/data/kuba-zip/0.2.4/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/include")
set(CONAN_LIB_DIRS_KUBA-ZIP "C:/Users/evan_/.conan/data/kuba-zip/0.2.4/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/lib")
set(CONAN_BIN_DIRS_KUBA-ZIP )
set(CONAN_RES_DIRS_KUBA-ZIP )
set(CONAN_SRC_DIRS_KUBA-ZIP )
set(CONAN_BUILD_DIRS_KUBA-ZIP "C:/Users/evan_/.conan/data/kuba-zip/0.2.4/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/")
set(CONAN_FRAMEWORK_DIRS_KUBA-ZIP )
set(CONAN_LIBS_KUBA-ZIP zip)
set(CONAN_PKG_LIBS_KUBA-ZIP zip)
set(CONAN_SYSTEM_LIBS_KUBA-ZIP )
set(CONAN_FRAMEWORKS_KUBA-ZIP )
set(CONAN_FRAMEWORKS_FOUND_KUBA-ZIP "")  # Will be filled later
set(CONAN_DEFINES_KUBA-ZIP )
set(CONAN_BUILD_MODULES_PATHS_KUBA-ZIP )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_KUBA-ZIP )

set(CONAN_C_FLAGS_KUBA-ZIP "")
set(CONAN_CXX_FLAGS_KUBA-ZIP "")
set(CONAN_SHARED_LINKER_FLAGS_KUBA-ZIP "")
set(CONAN_EXE_LINKER_FLAGS_KUBA-ZIP "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_KUBA-ZIP_LIST "")
set(CONAN_CXX_FLAGS_KUBA-ZIP_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_KUBA-ZIP_LIST "")
set(CONAN_EXE_LINKER_FLAGS_KUBA-ZIP_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_KUBA-ZIP "${CONAN_FRAMEWORKS_KUBA-ZIP}" "_KUBA-ZIP" "")
# Append to aggregated values variable
set(CONAN_LIBS_KUBA-ZIP ${CONAN_PKG_LIBS_KUBA-ZIP} ${CONAN_SYSTEM_LIBS_KUBA-ZIP} ${CONAN_FRAMEWORKS_FOUND_KUBA-ZIP})


#################
###  POLY2TRI
#################
set(CONAN_POLY2TRI_ROOT "C:/Users/evan_/.conan/data/poly2tri/cci.20130502/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f")
set(CONAN_INCLUDE_DIRS_POLY2TRI "C:/Users/evan_/.conan/data/poly2tri/cci.20130502/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f/include")
set(CONAN_LIB_DIRS_POLY2TRI "C:/Users/evan_/.conan/data/poly2tri/cci.20130502/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f/lib")
set(CONAN_BIN_DIRS_POLY2TRI )
set(CONAN_RES_DIRS_POLY2TRI )
set(CONAN_SRC_DIRS_POLY2TRI )
set(CONAN_BUILD_DIRS_POLY2TRI "C:/Users/evan_/.conan/data/poly2tri/cci.20130502/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f/")
set(CONAN_FRAMEWORK_DIRS_POLY2TRI )
set(CONAN_LIBS_POLY2TRI poly2tri)
set(CONAN_PKG_LIBS_POLY2TRI poly2tri)
set(CONAN_SYSTEM_LIBS_POLY2TRI )
set(CONAN_FRAMEWORKS_POLY2TRI )
set(CONAN_FRAMEWORKS_FOUND_POLY2TRI "")  # Will be filled later
set(CONAN_DEFINES_POLY2TRI )
set(CONAN_BUILD_MODULES_PATHS_POLY2TRI )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_POLY2TRI )

set(CONAN_C_FLAGS_POLY2TRI "")
set(CONAN_CXX_FLAGS_POLY2TRI "")
set(CONAN_SHARED_LINKER_FLAGS_POLY2TRI "")
set(CONAN_EXE_LINKER_FLAGS_POLY2TRI "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_POLY2TRI_LIST "")
set(CONAN_CXX_FLAGS_POLY2TRI_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_POLY2TRI_LIST "")
set(CONAN_EXE_LINKER_FLAGS_POLY2TRI_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_POLY2TRI "${CONAN_FRAMEWORKS_POLY2TRI}" "_POLY2TRI" "")
# Append to aggregated values variable
set(CONAN_LIBS_POLY2TRI ${CONAN_PKG_LIBS_POLY2TRI} ${CONAN_SYSTEM_LIBS_POLY2TRI} ${CONAN_FRAMEWORKS_FOUND_POLY2TRI})


#################
###  RAPIDJSON
#################
set(CONAN_RAPIDJSON_ROOT "C:/Users/evan_/.conan/data/rapidjson/cci.20211112/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_RAPIDJSON "C:/Users/evan_/.conan/data/rapidjson/cci.20211112/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include")
set(CONAN_LIB_DIRS_RAPIDJSON )
set(CONAN_BIN_DIRS_RAPIDJSON )
set(CONAN_RES_DIRS_RAPIDJSON )
set(CONAN_SRC_DIRS_RAPIDJSON )
set(CONAN_BUILD_DIRS_RAPIDJSON "C:/Users/evan_/.conan/data/rapidjson/cci.20211112/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_RAPIDJSON )
set(CONAN_LIBS_RAPIDJSON )
set(CONAN_PKG_LIBS_RAPIDJSON )
set(CONAN_SYSTEM_LIBS_RAPIDJSON )
set(CONAN_FRAMEWORKS_RAPIDJSON )
set(CONAN_FRAMEWORKS_FOUND_RAPIDJSON "")  # Will be filled later
set(CONAN_DEFINES_RAPIDJSON )
set(CONAN_BUILD_MODULES_PATHS_RAPIDJSON )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_RAPIDJSON )

set(CONAN_C_FLAGS_RAPIDJSON "")
set(CONAN_CXX_FLAGS_RAPIDJSON "")
set(CONAN_SHARED_LINKER_FLAGS_RAPIDJSON "")
set(CONAN_EXE_LINKER_FLAGS_RAPIDJSON "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_RAPIDJSON_LIST "")
set(CONAN_CXX_FLAGS_RAPIDJSON_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_RAPIDJSON_LIST "")
set(CONAN_EXE_LINKER_FLAGS_RAPIDJSON_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_RAPIDJSON "${CONAN_FRAMEWORKS_RAPIDJSON}" "_RAPIDJSON" "")
# Append to aggregated values variable
set(CONAN_LIBS_RAPIDJSON ${CONAN_PKG_LIBS_RAPIDJSON} ${CONAN_SYSTEM_LIBS_RAPIDJSON} ${CONAN_FRAMEWORKS_FOUND_RAPIDJSON})


#################
###  DRACO
#################
set(CONAN_DRACO_ROOT "C:/.conan/02acd7/1")
set(CONAN_INCLUDE_DIRS_DRACO "C:/.conan/02acd7/1/include")
set(CONAN_LIB_DIRS_DRACO "C:/.conan/02acd7/1/lib")
set(CONAN_BIN_DIRS_DRACO "C:/.conan/02acd7/1/bin")
set(CONAN_RES_DIRS_DRACO )
set(CONAN_SRC_DIRS_DRACO )
set(CONAN_BUILD_DIRS_DRACO "C:/.conan/02acd7/1/")
set(CONAN_FRAMEWORK_DIRS_DRACO )
set(CONAN_LIBS_DRACO draco)
set(CONAN_PKG_LIBS_DRACO draco)
set(CONAN_SYSTEM_LIBS_DRACO )
set(CONAN_FRAMEWORKS_DRACO )
set(CONAN_FRAMEWORKS_FOUND_DRACO "")  # Will be filled later
set(CONAN_DEFINES_DRACO )
set(CONAN_BUILD_MODULES_PATHS_DRACO )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_DRACO )

set(CONAN_C_FLAGS_DRACO "")
set(CONAN_CXX_FLAGS_DRACO "")
set(CONAN_SHARED_LINKER_FLAGS_DRACO "")
set(CONAN_EXE_LINKER_FLAGS_DRACO "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_DRACO_LIST "")
set(CONAN_CXX_FLAGS_DRACO_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_DRACO_LIST "")
set(CONAN_EXE_LINKER_FLAGS_DRACO_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_DRACO "${CONAN_FRAMEWORKS_DRACO}" "_DRACO" "")
# Append to aggregated values variable
set(CONAN_LIBS_DRACO ${CONAN_PKG_LIBS_DRACO} ${CONAN_SYSTEM_LIBS_DRACO} ${CONAN_FRAMEWORKS_FOUND_DRACO})


#################
###  CLIPPER
#################
set(CONAN_CLIPPER_ROOT "C:/Users/evan_/.conan/data/clipper/4.10.0/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f")
set(CONAN_INCLUDE_DIRS_CLIPPER "C:/Users/evan_/.conan/data/clipper/4.10.0/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f/include")
set(CONAN_LIB_DIRS_CLIPPER "C:/Users/evan_/.conan/data/clipper/4.10.0/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f/lib")
set(CONAN_BIN_DIRS_CLIPPER )
set(CONAN_RES_DIRS_CLIPPER )
set(CONAN_SRC_DIRS_CLIPPER )
set(CONAN_BUILD_DIRS_CLIPPER "C:/Users/evan_/.conan/data/clipper/4.10.0/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f/")
set(CONAN_FRAMEWORK_DIRS_CLIPPER )
set(CONAN_LIBS_CLIPPER polyclipping)
set(CONAN_PKG_LIBS_CLIPPER polyclipping)
set(CONAN_SYSTEM_LIBS_CLIPPER )
set(CONAN_FRAMEWORKS_CLIPPER )
set(CONAN_FRAMEWORKS_FOUND_CLIPPER "")  # Will be filled later
set(CONAN_DEFINES_CLIPPER )
set(CONAN_BUILD_MODULES_PATHS_CLIPPER )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_CLIPPER )

set(CONAN_C_FLAGS_CLIPPER "")
set(CONAN_CXX_FLAGS_CLIPPER "")
set(CONAN_SHARED_LINKER_FLAGS_CLIPPER "")
set(CONAN_EXE_LINKER_FLAGS_CLIPPER "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_CLIPPER_LIST "")
set(CONAN_CXX_FLAGS_CLIPPER_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_CLIPPER_LIST "")
set(CONAN_EXE_LINKER_FLAGS_CLIPPER_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_CLIPPER "${CONAN_FRAMEWORKS_CLIPPER}" "_CLIPPER" "")
# Append to aggregated values variable
set(CONAN_LIBS_CLIPPER ${CONAN_PKG_LIBS_CLIPPER} ${CONAN_SYSTEM_LIBS_CLIPPER} ${CONAN_FRAMEWORKS_FOUND_CLIPPER})


#################
###  STB
#################
set(CONAN_STB_ROOT "C:/Users/evan_/.conan/data/stb/cci.20210910/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_STB "C:/Users/evan_/.conan/data/stb/cci.20210910/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include")
set(CONAN_LIB_DIRS_STB )
set(CONAN_BIN_DIRS_STB )
set(CONAN_RES_DIRS_STB )
set(CONAN_SRC_DIRS_STB )
set(CONAN_BUILD_DIRS_STB "C:/Users/evan_/.conan/data/stb/cci.20210910/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_STB )
set(CONAN_LIBS_STB )
set(CONAN_PKG_LIBS_STB )
set(CONAN_SYSTEM_LIBS_STB )
set(CONAN_FRAMEWORKS_STB )
set(CONAN_FRAMEWORKS_FOUND_STB "")  # Will be filled later
set(CONAN_DEFINES_STB "-DSTB_TEXTEDIT_KEYTYPE=unsigned")
set(CONAN_BUILD_MODULES_PATHS_STB )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_STB "STB_TEXTEDIT_KEYTYPE=unsigned")

set(CONAN_C_FLAGS_STB "")
set(CONAN_CXX_FLAGS_STB "")
set(CONAN_SHARED_LINKER_FLAGS_STB "")
set(CONAN_EXE_LINKER_FLAGS_STB "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_STB_LIST "")
set(CONAN_CXX_FLAGS_STB_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_STB_LIST "")
set(CONAN_EXE_LINKER_FLAGS_STB_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_STB "${CONAN_FRAMEWORKS_STB}" "_STB" "")
# Append to aggregated values variable
set(CONAN_LIBS_STB ${CONAN_PKG_LIBS_STB} ${CONAN_SYSTEM_LIBS_STB} ${CONAN_FRAMEWORKS_FOUND_STB})


#################
###  OPENDDL-PARSER
#################
set(CONAN_OPENDDL-PARSER_ROOT "C:/Users/evan_/.conan/data/openddl-parser/0.5.0/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f")
set(CONAN_INCLUDE_DIRS_OPENDDL-PARSER "C:/Users/evan_/.conan/data/openddl-parser/0.5.0/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f/include")
set(CONAN_LIB_DIRS_OPENDDL-PARSER "C:/Users/evan_/.conan/data/openddl-parser/0.5.0/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f/lib")
set(CONAN_BIN_DIRS_OPENDDL-PARSER )
set(CONAN_RES_DIRS_OPENDDL-PARSER )
set(CONAN_SRC_DIRS_OPENDDL-PARSER )
set(CONAN_BUILD_DIRS_OPENDDL-PARSER "C:/Users/evan_/.conan/data/openddl-parser/0.5.0/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f/")
set(CONAN_FRAMEWORK_DIRS_OPENDDL-PARSER )
set(CONAN_LIBS_OPENDDL-PARSER openddlparser)
set(CONAN_PKG_LIBS_OPENDDL-PARSER openddlparser)
set(CONAN_SYSTEM_LIBS_OPENDDL-PARSER )
set(CONAN_FRAMEWORKS_OPENDDL-PARSER )
set(CONAN_FRAMEWORKS_FOUND_OPENDDL-PARSER "")  # Will be filled later
set(CONAN_DEFINES_OPENDDL-PARSER "-DOPENDDL_STATIC_LIBARY")
set(CONAN_BUILD_MODULES_PATHS_OPENDDL-PARSER )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_OPENDDL-PARSER "OPENDDL_STATIC_LIBARY")

set(CONAN_C_FLAGS_OPENDDL-PARSER "")
set(CONAN_CXX_FLAGS_OPENDDL-PARSER "")
set(CONAN_SHARED_LINKER_FLAGS_OPENDDL-PARSER "")
set(CONAN_EXE_LINKER_FLAGS_OPENDDL-PARSER "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_OPENDDL-PARSER_LIST "")
set(CONAN_CXX_FLAGS_OPENDDL-PARSER_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_OPENDDL-PARSER_LIST "")
set(CONAN_EXE_LINKER_FLAGS_OPENDDL-PARSER_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_OPENDDL-PARSER "${CONAN_FRAMEWORKS_OPENDDL-PARSER}" "_OPENDDL-PARSER" "")
# Append to aggregated values variable
set(CONAN_LIBS_OPENDDL-PARSER ${CONAN_PKG_LIBS_OPENDDL-PARSER} ${CONAN_SYSTEM_LIBS_OPENDDL-PARSER} ${CONAN_FRAMEWORKS_FOUND_OPENDDL-PARSER})


#################
###  ZLIB
#################
set(CONAN_ZLIB_ROOT "C:/Users/evan_/.conan/data/zlib/1.2.12/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b")
set(CONAN_INCLUDE_DIRS_ZLIB "C:/Users/evan_/.conan/data/zlib/1.2.12/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/include")
set(CONAN_LIB_DIRS_ZLIB "C:/Users/evan_/.conan/data/zlib/1.2.12/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/lib")
set(CONAN_BIN_DIRS_ZLIB )
set(CONAN_RES_DIRS_ZLIB )
set(CONAN_SRC_DIRS_ZLIB )
set(CONAN_BUILD_DIRS_ZLIB "C:/Users/evan_/.conan/data/zlib/1.2.12/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/")
set(CONAN_FRAMEWORK_DIRS_ZLIB )
set(CONAN_LIBS_ZLIB zlib)
set(CONAN_PKG_LIBS_ZLIB zlib)
set(CONAN_SYSTEM_LIBS_ZLIB )
set(CONAN_FRAMEWORKS_ZLIB )
set(CONAN_FRAMEWORKS_FOUND_ZLIB "")  # Will be filled later
set(CONAN_DEFINES_ZLIB )
set(CONAN_BUILD_MODULES_PATHS_ZLIB )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_ZLIB )

set(CONAN_C_FLAGS_ZLIB "")
set(CONAN_CXX_FLAGS_ZLIB "")
set(CONAN_SHARED_LINKER_FLAGS_ZLIB "")
set(CONAN_EXE_LINKER_FLAGS_ZLIB "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_ZLIB_LIST "")
set(CONAN_CXX_FLAGS_ZLIB_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_ZLIB_LIST "")
set(CONAN_EXE_LINKER_FLAGS_ZLIB_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_ZLIB "${CONAN_FRAMEWORKS_ZLIB}" "_ZLIB" "")
# Append to aggregated values variable
set(CONAN_LIBS_ZLIB ${CONAN_PKG_LIBS_ZLIB} ${CONAN_SYSTEM_LIBS_ZLIB} ${CONAN_FRAMEWORKS_FOUND_ZLIB})


#################
###  BZIP2
#################
set(CONAN_BZIP2_ROOT "C:/Users/evan_/.conan/data/bzip2/1.0.8/_/_/package/53b5fd22ba061620078deefdae9a437c5f693201")
set(CONAN_INCLUDE_DIRS_BZIP2 "C:/Users/evan_/.conan/data/bzip2/1.0.8/_/_/package/53b5fd22ba061620078deefdae9a437c5f693201/include")
set(CONAN_LIB_DIRS_BZIP2 "C:/Users/evan_/.conan/data/bzip2/1.0.8/_/_/package/53b5fd22ba061620078deefdae9a437c5f693201/lib")
set(CONAN_BIN_DIRS_BZIP2 "C:/Users/evan_/.conan/data/bzip2/1.0.8/_/_/package/53b5fd22ba061620078deefdae9a437c5f693201/bin")
set(CONAN_RES_DIRS_BZIP2 )
set(CONAN_SRC_DIRS_BZIP2 )
set(CONAN_BUILD_DIRS_BZIP2 "C:/Users/evan_/.conan/data/bzip2/1.0.8/_/_/package/53b5fd22ba061620078deefdae9a437c5f693201/")
set(CONAN_FRAMEWORK_DIRS_BZIP2 )
set(CONAN_LIBS_BZIP2 bz2)
set(CONAN_PKG_LIBS_BZIP2 bz2)
set(CONAN_SYSTEM_LIBS_BZIP2 )
set(CONAN_FRAMEWORKS_BZIP2 )
set(CONAN_FRAMEWORKS_FOUND_BZIP2 "")  # Will be filled later
set(CONAN_DEFINES_BZIP2 )
set(CONAN_BUILD_MODULES_PATHS_BZIP2 )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BZIP2 )

set(CONAN_C_FLAGS_BZIP2 "")
set(CONAN_CXX_FLAGS_BZIP2 "")
set(CONAN_SHARED_LINKER_FLAGS_BZIP2 "")
set(CONAN_EXE_LINKER_FLAGS_BZIP2 "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BZIP2_LIST "")
set(CONAN_CXX_FLAGS_BZIP2_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BZIP2_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BZIP2_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BZIP2 "${CONAN_FRAMEWORKS_BZIP2}" "_BZIP2" "")
# Append to aggregated values variable
set(CONAN_LIBS_BZIP2 ${CONAN_PKG_LIBS_BZIP2} ${CONAN_SYSTEM_LIBS_BZIP2} ${CONAN_FRAMEWORKS_FOUND_BZIP2})


### Definition of global aggregated variables ###

set(CONAN_PACKAGE_NAME None)
set(CONAN_PACKAGE_VERSION None)

set(CONAN_SETTINGS_ARCH "x86_64")
set(CONAN_SETTINGS_ARCH_BUILD "x86_64")
set(CONAN_SETTINGS_BUILD_TYPE "Release")
set(CONAN_SETTINGS_COMPILER "Visual Studio")
set(CONAN_SETTINGS_COMPILER_CPPSTD "20")
set(CONAN_SETTINGS_COMPILER_RUNTIME "MD")
set(CONAN_SETTINGS_COMPILER_VERSION "17")
set(CONAN_SETTINGS_OS "Windows")
set(CONAN_SETTINGS_OS_BUILD "Windows")

set(CONAN_DEPENDENCIES glad glfw flecs tl-expected assimp glm luau opengl minizip utfcpp pugixml kuba-zip poly2tri rapidjson draco clipper stb openddl-parser zlib bzip2)
# Storing original command line args (CMake helper) flags
set(CONAN_CMD_CXX_FLAGS ${CONAN_CXX_FLAGS})

set(CONAN_CMD_SHARED_LINKER_FLAGS ${CONAN_SHARED_LINKER_FLAGS})
set(CONAN_CMD_C_FLAGS ${CONAN_C_FLAGS})
# Defining accumulated conan variables for all deps

set(CONAN_INCLUDE_DIRS "C:/Users/evan_/.conan/data/glad/0.1.36/_/_/package/78d45823d59453237bf9c9a6030a8ea718d81ca0/include"
			"C:/Users/evan_/.conan/data/glfw/3.3.8/_/_/package/d2bbd56c1f653d6cd1a2bcf499dd79bd0a930b61/include"
			"C:/Users/evan_/.conan/data/flecs/3.0.4/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/include"
			"C:/Users/evan_/.conan/data/tl-expected/20190710/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include"
			"C:/Users/evan_/.conan/data/assimp/5.2.2/_/_/package/1850bc4ebd4615802a8c0c936c43e59647dd7771/include"
			"C:/Users/evan_/.conan/data/glm/cci.20220420/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include"
			"C:/Users/evan_/.conan/data/luau/0.544/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f/include"
			"C:/Users/evan_/.conan/data/minizip/1.2.12/_/_/package/4835c5fd5db705679d749d756c4af2beb7d8773c/include"
			"C:/Users/evan_/.conan/data/minizip/1.2.12/_/_/package/4835c5fd5db705679d749d756c4af2beb7d8773c/include/minizip"
			"C:/Users/evan_/.conan/data/utfcpp/3.2.1/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include"
			"C:/Users/evan_/.conan/data/utfcpp/3.2.1/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include/utf8cpp"
			"C:/Users/evan_/.conan/data/pugixml/1.12.1/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f/include"
			"C:/Users/evan_/.conan/data/kuba-zip/0.2.4/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/include"
			"C:/Users/evan_/.conan/data/poly2tri/cci.20130502/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f/include"
			"C:/Users/evan_/.conan/data/rapidjson/cci.20211112/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include"
			"C:/.conan/02acd7/1/include"
			"C:/Users/evan_/.conan/data/clipper/4.10.0/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f/include"
			"C:/Users/evan_/.conan/data/stb/cci.20210910/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include"
			"C:/Users/evan_/.conan/data/openddl-parser/0.5.0/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f/include"
			"C:/Users/evan_/.conan/data/zlib/1.2.12/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/include"
			"C:/Users/evan_/.conan/data/bzip2/1.0.8/_/_/package/53b5fd22ba061620078deefdae9a437c5f693201/include" ${CONAN_INCLUDE_DIRS})
set(CONAN_LIB_DIRS "C:/Users/evan_/.conan/data/glad/0.1.36/_/_/package/78d45823d59453237bf9c9a6030a8ea718d81ca0/lib"
			"C:/Users/evan_/.conan/data/glfw/3.3.8/_/_/package/d2bbd56c1f653d6cd1a2bcf499dd79bd0a930b61/lib"
			"C:/Users/evan_/.conan/data/flecs/3.0.4/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/lib"
			"C:/Users/evan_/.conan/data/assimp/5.2.2/_/_/package/1850bc4ebd4615802a8c0c936c43e59647dd7771/lib"
			"C:/Users/evan_/.conan/data/luau/0.544/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f/lib"
			"C:/Users/evan_/.conan/data/minizip/1.2.12/_/_/package/4835c5fd5db705679d749d756c4af2beb7d8773c/lib"
			"C:/Users/evan_/.conan/data/pugixml/1.12.1/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f/lib"
			"C:/Users/evan_/.conan/data/kuba-zip/0.2.4/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/lib"
			"C:/Users/evan_/.conan/data/poly2tri/cci.20130502/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f/lib"
			"C:/.conan/02acd7/1/lib"
			"C:/Users/evan_/.conan/data/clipper/4.10.0/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f/lib"
			"C:/Users/evan_/.conan/data/openddl-parser/0.5.0/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f/lib"
			"C:/Users/evan_/.conan/data/zlib/1.2.12/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/lib"
			"C:/Users/evan_/.conan/data/bzip2/1.0.8/_/_/package/53b5fd22ba061620078deefdae9a437c5f693201/lib" ${CONAN_LIB_DIRS})
set(CONAN_BIN_DIRS "C:/Users/evan_/.conan/data/flecs/3.0.4/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/bin"
			"C:/.conan/02acd7/1/bin"
			"C:/Users/evan_/.conan/data/bzip2/1.0.8/_/_/package/53b5fd22ba061620078deefdae9a437c5f693201/bin" ${CONAN_BIN_DIRS})
set(CONAN_RES_DIRS  ${CONAN_RES_DIRS})
set(CONAN_FRAMEWORK_DIRS  ${CONAN_FRAMEWORK_DIRS})
set(CONAN_LIBS glad glfw3 flecs_static assimp-vc143-mt Luau.VM Luau.Analysis Luau.Compiler Luau.CodeGen Luau.Ast minizip pugixml zip poly2tri draco polyclipping openddlparser zlib bz2 ${CONAN_LIBS})
set(CONAN_PKG_LIBS glad glfw3 flecs_static assimp-vc143-mt Luau.VM Luau.Analysis Luau.Compiler Luau.CodeGen Luau.Ast minizip pugixml zip poly2tri draco polyclipping openddlparser zlib bz2 ${CONAN_PKG_LIBS})
set(CONAN_SYSTEM_LIBS gdi32 wsock32 ws2_32 opengl32 ${CONAN_SYSTEM_LIBS})
set(CONAN_FRAMEWORKS  ${CONAN_FRAMEWORKS})
set(CONAN_FRAMEWORKS_FOUND "")  # Will be filled later
set(CONAN_DEFINES "-DOPENDDL_STATIC_LIBARY"
			"-DSTB_TEXTEDIT_KEYTYPE=unsigned"
			"-DHAVE_BZIP2"
			"-Dflecs_STATIC" ${CONAN_DEFINES})
set(CONAN_BUILD_MODULES_PATHS  ${CONAN_BUILD_MODULES_PATHS})
set(CONAN_CMAKE_MODULE_PATH "C:/Users/evan_/.conan/data/glad/0.1.36/_/_/package/78d45823d59453237bf9c9a6030a8ea718d81ca0/"
			"C:/Users/evan_/.conan/data/glfw/3.3.8/_/_/package/d2bbd56c1f653d6cd1a2bcf499dd79bd0a930b61/"
			"C:/Users/evan_/.conan/data/assimp/5.2.2/_/_/package/1850bc4ebd4615802a8c0c936c43e59647dd7771/"
			"C:/Users/evan_/.conan/data/glm/cci.20220420/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"C:/Users/evan_/.conan/data/luau/0.544/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f/"
			"C:/Users/evan_/.conan/data/opengl/system/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"C:/Users/evan_/.conan/data/minizip/1.2.12/_/_/package/4835c5fd5db705679d749d756c4af2beb7d8773c/"
			"C:/Users/evan_/.conan/data/utfcpp/3.2.1/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"C:/Users/evan_/.conan/data/pugixml/1.12.1/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f/"
			"C:/Users/evan_/.conan/data/kuba-zip/0.2.4/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/"
			"C:/Users/evan_/.conan/data/poly2tri/cci.20130502/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f/"
			"C:/Users/evan_/.conan/data/rapidjson/cci.20211112/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"C:/.conan/02acd7/1/"
			"C:/Users/evan_/.conan/data/clipper/4.10.0/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f/"
			"C:/Users/evan_/.conan/data/stb/cci.20210910/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"C:/Users/evan_/.conan/data/openddl-parser/0.5.0/_/_/package/45046cca4611564b3e723e57d427413b1c2c937f/"
			"C:/Users/evan_/.conan/data/zlib/1.2.12/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/"
			"C:/Users/evan_/.conan/data/bzip2/1.0.8/_/_/package/53b5fd22ba061620078deefdae9a437c5f693201/" ${CONAN_CMAKE_MODULE_PATH})

set(CONAN_CXX_FLAGS " ${CONAN_CXX_FLAGS}")
set(CONAN_SHARED_LINKER_FLAGS " ${CONAN_SHARED_LINKER_FLAGS}")
set(CONAN_EXE_LINKER_FLAGS " ${CONAN_EXE_LINKER_FLAGS}")
set(CONAN_C_FLAGS " ${CONAN_C_FLAGS}")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND "${CONAN_FRAMEWORKS}" "" "")
# Append to aggregated values variable: Use CONAN_LIBS instead of CONAN_PKG_LIBS to include user appended vars
set(CONAN_LIBS ${CONAN_LIBS} ${CONAN_SYSTEM_LIBS} ${CONAN_FRAMEWORKS_FOUND})


###  Definition of macros and functions ###

macro(conan_define_targets)
    if(${CMAKE_VERSION} VERSION_LESS "3.1.2")
        message(FATAL_ERROR "TARGETS not supported by your CMake version!")
    endif()  # CMAKE > 3.x
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CONAN_CMD_CXX_FLAGS}")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CONAN_CMD_C_FLAGS}")
    set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${CONAN_CMD_SHARED_LINKER_FLAGS}")


    set(_CONAN_PKG_LIBS_GLAD_DEPENDENCIES "${CONAN_SYSTEM_LIBS_GLAD} ${CONAN_FRAMEWORKS_FOUND_GLAD} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLAD_DEPENDENCIES "${_CONAN_PKG_LIBS_GLAD_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLAD}" "${CONAN_LIB_DIRS_GLAD}"
                                  CONAN_PACKAGE_TARGETS_GLAD "${_CONAN_PKG_LIBS_GLAD_DEPENDENCIES}"
                                  "" glad)
    set(_CONAN_PKG_LIBS_GLAD_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_GLAD_DEBUG} ${CONAN_FRAMEWORKS_FOUND_GLAD_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLAD_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_GLAD_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLAD_DEBUG}" "${CONAN_LIB_DIRS_GLAD_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_GLAD_DEBUG "${_CONAN_PKG_LIBS_GLAD_DEPENDENCIES_DEBUG}"
                                  "debug" glad)
    set(_CONAN_PKG_LIBS_GLAD_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_GLAD_RELEASE} ${CONAN_FRAMEWORKS_FOUND_GLAD_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLAD_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_GLAD_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLAD_RELEASE}" "${CONAN_LIB_DIRS_GLAD_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_GLAD_RELEASE "${_CONAN_PKG_LIBS_GLAD_DEPENDENCIES_RELEASE}"
                                  "release" glad)
    set(_CONAN_PKG_LIBS_GLAD_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_GLAD_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_GLAD_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLAD_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_GLAD_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLAD_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_GLAD_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_GLAD_RELWITHDEBINFO "${_CONAN_PKG_LIBS_GLAD_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" glad)
    set(_CONAN_PKG_LIBS_GLAD_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_GLAD_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_GLAD_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLAD_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_GLAD_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLAD_MINSIZEREL}" "${CONAN_LIB_DIRS_GLAD_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_GLAD_MINSIZEREL "${_CONAN_PKG_LIBS_GLAD_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" glad)

    add_library(CONAN_PKG::glad INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::glad PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_GLAD} ${_CONAN_PKG_LIBS_GLAD_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLAD_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLAD_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLAD_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_GLAD_RELEASE} ${_CONAN_PKG_LIBS_GLAD_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLAD_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLAD_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLAD_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_GLAD_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_GLAD_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLAD_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLAD_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLAD_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_GLAD_MINSIZEREL} ${_CONAN_PKG_LIBS_GLAD_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLAD_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLAD_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLAD_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_GLAD_DEBUG} ${_CONAN_PKG_LIBS_GLAD_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLAD_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLAD_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLAD_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::glad PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_GLAD}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_GLAD_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_GLAD_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_GLAD_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_GLAD_DEBUG}>)
    set_property(TARGET CONAN_PKG::glad PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_GLAD}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_GLAD_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_GLAD_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_GLAD_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_GLAD_DEBUG}>)
    set_property(TARGET CONAN_PKG::glad PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_GLAD_LIST} ${CONAN_CXX_FLAGS_GLAD_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_GLAD_RELEASE_LIST} ${CONAN_CXX_FLAGS_GLAD_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_GLAD_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_GLAD_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_GLAD_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_GLAD_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_GLAD_DEBUG_LIST}  ${CONAN_CXX_FLAGS_GLAD_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_GLFW_DEPENDENCIES "${CONAN_SYSTEM_LIBS_GLFW} ${CONAN_FRAMEWORKS_FOUND_GLFW} CONAN_PKG::opengl")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLFW_DEPENDENCIES "${_CONAN_PKG_LIBS_GLFW_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLFW}" "${CONAN_LIB_DIRS_GLFW}"
                                  CONAN_PACKAGE_TARGETS_GLFW "${_CONAN_PKG_LIBS_GLFW_DEPENDENCIES}"
                                  "" glfw)
    set(_CONAN_PKG_LIBS_GLFW_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_GLFW_DEBUG} ${CONAN_FRAMEWORKS_FOUND_GLFW_DEBUG} CONAN_PKG::opengl")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLFW_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_GLFW_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLFW_DEBUG}" "${CONAN_LIB_DIRS_GLFW_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_GLFW_DEBUG "${_CONAN_PKG_LIBS_GLFW_DEPENDENCIES_DEBUG}"
                                  "debug" glfw)
    set(_CONAN_PKG_LIBS_GLFW_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_GLFW_RELEASE} ${CONAN_FRAMEWORKS_FOUND_GLFW_RELEASE} CONAN_PKG::opengl")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLFW_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_GLFW_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLFW_RELEASE}" "${CONAN_LIB_DIRS_GLFW_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_GLFW_RELEASE "${_CONAN_PKG_LIBS_GLFW_DEPENDENCIES_RELEASE}"
                                  "release" glfw)
    set(_CONAN_PKG_LIBS_GLFW_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_GLFW_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_GLFW_RELWITHDEBINFO} CONAN_PKG::opengl")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLFW_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_GLFW_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLFW_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_GLFW_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_GLFW_RELWITHDEBINFO "${_CONAN_PKG_LIBS_GLFW_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" glfw)
    set(_CONAN_PKG_LIBS_GLFW_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_GLFW_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_GLFW_MINSIZEREL} CONAN_PKG::opengl")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLFW_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_GLFW_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLFW_MINSIZEREL}" "${CONAN_LIB_DIRS_GLFW_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_GLFW_MINSIZEREL "${_CONAN_PKG_LIBS_GLFW_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" glfw)

    add_library(CONAN_PKG::glfw INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::glfw PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_GLFW} ${_CONAN_PKG_LIBS_GLFW_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLFW_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLFW_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLFW_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_GLFW_RELEASE} ${_CONAN_PKG_LIBS_GLFW_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLFW_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLFW_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLFW_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_GLFW_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_GLFW_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLFW_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLFW_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLFW_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_GLFW_MINSIZEREL} ${_CONAN_PKG_LIBS_GLFW_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLFW_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLFW_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLFW_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_GLFW_DEBUG} ${_CONAN_PKG_LIBS_GLFW_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLFW_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLFW_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLFW_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::glfw PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_GLFW}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_GLFW_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_GLFW_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_GLFW_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_GLFW_DEBUG}>)
    set_property(TARGET CONAN_PKG::glfw PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_GLFW}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_GLFW_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_GLFW_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_GLFW_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_GLFW_DEBUG}>)
    set_property(TARGET CONAN_PKG::glfw PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_GLFW_LIST} ${CONAN_CXX_FLAGS_GLFW_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_GLFW_RELEASE_LIST} ${CONAN_CXX_FLAGS_GLFW_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_GLFW_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_GLFW_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_GLFW_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_GLFW_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_GLFW_DEBUG_LIST}  ${CONAN_CXX_FLAGS_GLFW_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_FLECS_DEPENDENCIES "${CONAN_SYSTEM_LIBS_FLECS} ${CONAN_FRAMEWORKS_FOUND_FLECS} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FLECS_DEPENDENCIES "${_CONAN_PKG_LIBS_FLECS_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FLECS}" "${CONAN_LIB_DIRS_FLECS}"
                                  CONAN_PACKAGE_TARGETS_FLECS "${_CONAN_PKG_LIBS_FLECS_DEPENDENCIES}"
                                  "" flecs)
    set(_CONAN_PKG_LIBS_FLECS_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_FLECS_DEBUG} ${CONAN_FRAMEWORKS_FOUND_FLECS_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FLECS_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_FLECS_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FLECS_DEBUG}" "${CONAN_LIB_DIRS_FLECS_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_FLECS_DEBUG "${_CONAN_PKG_LIBS_FLECS_DEPENDENCIES_DEBUG}"
                                  "debug" flecs)
    set(_CONAN_PKG_LIBS_FLECS_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_FLECS_RELEASE} ${CONAN_FRAMEWORKS_FOUND_FLECS_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FLECS_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_FLECS_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FLECS_RELEASE}" "${CONAN_LIB_DIRS_FLECS_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_FLECS_RELEASE "${_CONAN_PKG_LIBS_FLECS_DEPENDENCIES_RELEASE}"
                                  "release" flecs)
    set(_CONAN_PKG_LIBS_FLECS_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_FLECS_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_FLECS_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FLECS_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_FLECS_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FLECS_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_FLECS_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_FLECS_RELWITHDEBINFO "${_CONAN_PKG_LIBS_FLECS_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" flecs)
    set(_CONAN_PKG_LIBS_FLECS_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_FLECS_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_FLECS_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FLECS_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_FLECS_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FLECS_MINSIZEREL}" "${CONAN_LIB_DIRS_FLECS_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_FLECS_MINSIZEREL "${_CONAN_PKG_LIBS_FLECS_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" flecs)

    add_library(CONAN_PKG::flecs INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::flecs PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_FLECS} ${_CONAN_PKG_LIBS_FLECS_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FLECS_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FLECS_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FLECS_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_FLECS_RELEASE} ${_CONAN_PKG_LIBS_FLECS_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FLECS_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FLECS_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FLECS_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_FLECS_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_FLECS_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FLECS_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FLECS_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FLECS_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_FLECS_MINSIZEREL} ${_CONAN_PKG_LIBS_FLECS_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FLECS_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FLECS_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FLECS_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_FLECS_DEBUG} ${_CONAN_PKG_LIBS_FLECS_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FLECS_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FLECS_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FLECS_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::flecs PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_FLECS}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_FLECS_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_FLECS_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_FLECS_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_FLECS_DEBUG}>)
    set_property(TARGET CONAN_PKG::flecs PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_FLECS}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_FLECS_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_FLECS_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_FLECS_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_FLECS_DEBUG}>)
    set_property(TARGET CONAN_PKG::flecs PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_FLECS_LIST} ${CONAN_CXX_FLAGS_FLECS_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_FLECS_RELEASE_LIST} ${CONAN_CXX_FLAGS_FLECS_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_FLECS_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_FLECS_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_FLECS_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_FLECS_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_FLECS_DEBUG_LIST}  ${CONAN_CXX_FLAGS_FLECS_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_TL-EXPECTED_DEPENDENCIES "${CONAN_SYSTEM_LIBS_TL-EXPECTED} ${CONAN_FRAMEWORKS_FOUND_TL-EXPECTED} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_TL-EXPECTED_DEPENDENCIES "${_CONAN_PKG_LIBS_TL-EXPECTED_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_TL-EXPECTED}" "${CONAN_LIB_DIRS_TL-EXPECTED}"
                                  CONAN_PACKAGE_TARGETS_TL-EXPECTED "${_CONAN_PKG_LIBS_TL-EXPECTED_DEPENDENCIES}"
                                  "" tl-expected)
    set(_CONAN_PKG_LIBS_TL-EXPECTED_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_TL-EXPECTED_DEBUG} ${CONAN_FRAMEWORKS_FOUND_TL-EXPECTED_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_TL-EXPECTED_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_TL-EXPECTED_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_TL-EXPECTED_DEBUG}" "${CONAN_LIB_DIRS_TL-EXPECTED_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_TL-EXPECTED_DEBUG "${_CONAN_PKG_LIBS_TL-EXPECTED_DEPENDENCIES_DEBUG}"
                                  "debug" tl-expected)
    set(_CONAN_PKG_LIBS_TL-EXPECTED_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_TL-EXPECTED_RELEASE} ${CONAN_FRAMEWORKS_FOUND_TL-EXPECTED_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_TL-EXPECTED_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_TL-EXPECTED_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_TL-EXPECTED_RELEASE}" "${CONAN_LIB_DIRS_TL-EXPECTED_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_TL-EXPECTED_RELEASE "${_CONAN_PKG_LIBS_TL-EXPECTED_DEPENDENCIES_RELEASE}"
                                  "release" tl-expected)
    set(_CONAN_PKG_LIBS_TL-EXPECTED_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_TL-EXPECTED_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_TL-EXPECTED_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_TL-EXPECTED_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_TL-EXPECTED_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_TL-EXPECTED_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_TL-EXPECTED_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_TL-EXPECTED_RELWITHDEBINFO "${_CONAN_PKG_LIBS_TL-EXPECTED_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" tl-expected)
    set(_CONAN_PKG_LIBS_TL-EXPECTED_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_TL-EXPECTED_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_TL-EXPECTED_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_TL-EXPECTED_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_TL-EXPECTED_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_TL-EXPECTED_MINSIZEREL}" "${CONAN_LIB_DIRS_TL-EXPECTED_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_TL-EXPECTED_MINSIZEREL "${_CONAN_PKG_LIBS_TL-EXPECTED_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" tl-expected)

    add_library(CONAN_PKG::tl-expected INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::tl-expected PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_TL-EXPECTED} ${_CONAN_PKG_LIBS_TL-EXPECTED_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_TL-EXPECTED_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_TL-EXPECTED_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_TL-EXPECTED_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_TL-EXPECTED_RELEASE} ${_CONAN_PKG_LIBS_TL-EXPECTED_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_TL-EXPECTED_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_TL-EXPECTED_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_TL-EXPECTED_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_TL-EXPECTED_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_TL-EXPECTED_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_TL-EXPECTED_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_TL-EXPECTED_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_TL-EXPECTED_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_TL-EXPECTED_MINSIZEREL} ${_CONAN_PKG_LIBS_TL-EXPECTED_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_TL-EXPECTED_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_TL-EXPECTED_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_TL-EXPECTED_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_TL-EXPECTED_DEBUG} ${_CONAN_PKG_LIBS_TL-EXPECTED_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_TL-EXPECTED_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_TL-EXPECTED_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_TL-EXPECTED_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::tl-expected PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_TL-EXPECTED}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_TL-EXPECTED_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_TL-EXPECTED_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_TL-EXPECTED_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_TL-EXPECTED_DEBUG}>)
    set_property(TARGET CONAN_PKG::tl-expected PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_TL-EXPECTED}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_TL-EXPECTED_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_TL-EXPECTED_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_TL-EXPECTED_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_TL-EXPECTED_DEBUG}>)
    set_property(TARGET CONAN_PKG::tl-expected PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_TL-EXPECTED_LIST} ${CONAN_CXX_FLAGS_TL-EXPECTED_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_TL-EXPECTED_RELEASE_LIST} ${CONAN_CXX_FLAGS_TL-EXPECTED_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_TL-EXPECTED_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_TL-EXPECTED_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_TL-EXPECTED_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_TL-EXPECTED_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_TL-EXPECTED_DEBUG_LIST}  ${CONAN_CXX_FLAGS_TL-EXPECTED_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES "${CONAN_SYSTEM_LIBS_ASSIMP} ${CONAN_FRAMEWORKS_FOUND_ASSIMP} CONAN_PKG::minizip CONAN_PKG::utfcpp CONAN_PKG::pugixml CONAN_PKG::kuba-zip CONAN_PKG::poly2tri CONAN_PKG::rapidjson CONAN_PKG::zlib CONAN_PKG::draco CONAN_PKG::clipper CONAN_PKG::stb CONAN_PKG::openddl-parser")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES "${_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ASSIMP}" "${CONAN_LIB_DIRS_ASSIMP}"
                                  CONAN_PACKAGE_TARGETS_ASSIMP "${_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES}"
                                  "" assimp)
    set(_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_ASSIMP_DEBUG} ${CONAN_FRAMEWORKS_FOUND_ASSIMP_DEBUG} CONAN_PKG::minizip CONAN_PKG::utfcpp CONAN_PKG::pugixml CONAN_PKG::kuba-zip CONAN_PKG::poly2tri CONAN_PKG::rapidjson CONAN_PKG::zlib CONAN_PKG::draco CONAN_PKG::clipper CONAN_PKG::stb CONAN_PKG::openddl-parser")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ASSIMP_DEBUG}" "${CONAN_LIB_DIRS_ASSIMP_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_ASSIMP_DEBUG "${_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_DEBUG}"
                                  "debug" assimp)
    set(_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_ASSIMP_RELEASE} ${CONAN_FRAMEWORKS_FOUND_ASSIMP_RELEASE} CONAN_PKG::minizip CONAN_PKG::utfcpp CONAN_PKG::pugixml CONAN_PKG::kuba-zip CONAN_PKG::poly2tri CONAN_PKG::rapidjson CONAN_PKG::zlib CONAN_PKG::draco CONAN_PKG::clipper CONAN_PKG::stb CONAN_PKG::openddl-parser")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ASSIMP_RELEASE}" "${CONAN_LIB_DIRS_ASSIMP_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_ASSIMP_RELEASE "${_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_RELEASE}"
                                  "release" assimp)
    set(_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_ASSIMP_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_ASSIMP_RELWITHDEBINFO} CONAN_PKG::minizip CONAN_PKG::utfcpp CONAN_PKG::pugixml CONAN_PKG::kuba-zip CONAN_PKG::poly2tri CONAN_PKG::rapidjson CONAN_PKG::zlib CONAN_PKG::draco CONAN_PKG::clipper CONAN_PKG::stb CONAN_PKG::openddl-parser")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ASSIMP_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_ASSIMP_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_ASSIMP_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" assimp)
    set(_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_ASSIMP_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_ASSIMP_MINSIZEREL} CONAN_PKG::minizip CONAN_PKG::utfcpp CONAN_PKG::pugixml CONAN_PKG::kuba-zip CONAN_PKG::poly2tri CONAN_PKG::rapidjson CONAN_PKG::zlib CONAN_PKG::draco CONAN_PKG::clipper CONAN_PKG::stb CONAN_PKG::openddl-parser")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ASSIMP_MINSIZEREL}" "${CONAN_LIB_DIRS_ASSIMP_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_ASSIMP_MINSIZEREL "${_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" assimp)

    add_library(CONAN_PKG::assimp INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::assimp PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_ASSIMP} ${_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASSIMP_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASSIMP_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ASSIMP_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_ASSIMP_RELEASE} ${_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASSIMP_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASSIMP_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ASSIMP_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_ASSIMP_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASSIMP_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASSIMP_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ASSIMP_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_ASSIMP_MINSIZEREL} ${_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASSIMP_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASSIMP_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ASSIMP_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_ASSIMP_DEBUG} ${_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASSIMP_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASSIMP_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ASSIMP_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::assimp PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_ASSIMP}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_ASSIMP_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_ASSIMP_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_ASSIMP_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_ASSIMP_DEBUG}>)
    set_property(TARGET CONAN_PKG::assimp PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_ASSIMP}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_ASSIMP_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_ASSIMP_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_ASSIMP_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_ASSIMP_DEBUG}>)
    set_property(TARGET CONAN_PKG::assimp PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_ASSIMP_LIST} ${CONAN_CXX_FLAGS_ASSIMP_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_ASSIMP_RELEASE_LIST} ${CONAN_CXX_FLAGS_ASSIMP_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_ASSIMP_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_ASSIMP_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_ASSIMP_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_ASSIMP_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_ASSIMP_DEBUG_LIST}  ${CONAN_CXX_FLAGS_ASSIMP_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_GLM_DEPENDENCIES "${CONAN_SYSTEM_LIBS_GLM} ${CONAN_FRAMEWORKS_FOUND_GLM} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLM_DEPENDENCIES "${_CONAN_PKG_LIBS_GLM_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLM}" "${CONAN_LIB_DIRS_GLM}"
                                  CONAN_PACKAGE_TARGETS_GLM "${_CONAN_PKG_LIBS_GLM_DEPENDENCIES}"
                                  "" glm)
    set(_CONAN_PKG_LIBS_GLM_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_GLM_DEBUG} ${CONAN_FRAMEWORKS_FOUND_GLM_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLM_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_GLM_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLM_DEBUG}" "${CONAN_LIB_DIRS_GLM_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_GLM_DEBUG "${_CONAN_PKG_LIBS_GLM_DEPENDENCIES_DEBUG}"
                                  "debug" glm)
    set(_CONAN_PKG_LIBS_GLM_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_GLM_RELEASE} ${CONAN_FRAMEWORKS_FOUND_GLM_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLM_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_GLM_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLM_RELEASE}" "${CONAN_LIB_DIRS_GLM_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_GLM_RELEASE "${_CONAN_PKG_LIBS_GLM_DEPENDENCIES_RELEASE}"
                                  "release" glm)
    set(_CONAN_PKG_LIBS_GLM_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_GLM_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_GLM_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLM_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_GLM_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLM_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_GLM_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_GLM_RELWITHDEBINFO "${_CONAN_PKG_LIBS_GLM_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" glm)
    set(_CONAN_PKG_LIBS_GLM_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_GLM_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_GLM_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLM_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_GLM_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLM_MINSIZEREL}" "${CONAN_LIB_DIRS_GLM_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_GLM_MINSIZEREL "${_CONAN_PKG_LIBS_GLM_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" glm)

    add_library(CONAN_PKG::glm INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::glm PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_GLM} ${_CONAN_PKG_LIBS_GLM_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLM_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLM_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLM_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_GLM_RELEASE} ${_CONAN_PKG_LIBS_GLM_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLM_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLM_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLM_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_GLM_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_GLM_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLM_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLM_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLM_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_GLM_MINSIZEREL} ${_CONAN_PKG_LIBS_GLM_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLM_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLM_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLM_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_GLM_DEBUG} ${_CONAN_PKG_LIBS_GLM_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLM_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLM_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLM_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::glm PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_GLM}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_GLM_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_GLM_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_GLM_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_GLM_DEBUG}>)
    set_property(TARGET CONAN_PKG::glm PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_GLM}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_GLM_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_GLM_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_GLM_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_GLM_DEBUG}>)
    set_property(TARGET CONAN_PKG::glm PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_GLM_LIST} ${CONAN_CXX_FLAGS_GLM_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_GLM_RELEASE_LIST} ${CONAN_CXX_FLAGS_GLM_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_GLM_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_GLM_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_GLM_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_GLM_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_GLM_DEBUG_LIST}  ${CONAN_CXX_FLAGS_GLM_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LUAU_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LUAU} ${CONAN_FRAMEWORKS_FOUND_LUAU} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LUAU_DEPENDENCIES "${_CONAN_PKG_LIBS_LUAU_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LUAU}" "${CONAN_LIB_DIRS_LUAU}"
                                  CONAN_PACKAGE_TARGETS_LUAU "${_CONAN_PKG_LIBS_LUAU_DEPENDENCIES}"
                                  "" luau)
    set(_CONAN_PKG_LIBS_LUAU_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LUAU_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LUAU_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LUAU_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LUAU_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LUAU_DEBUG}" "${CONAN_LIB_DIRS_LUAU_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LUAU_DEBUG "${_CONAN_PKG_LIBS_LUAU_DEPENDENCIES_DEBUG}"
                                  "debug" luau)
    set(_CONAN_PKG_LIBS_LUAU_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LUAU_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LUAU_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LUAU_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LUAU_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LUAU_RELEASE}" "${CONAN_LIB_DIRS_LUAU_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LUAU_RELEASE "${_CONAN_PKG_LIBS_LUAU_DEPENDENCIES_RELEASE}"
                                  "release" luau)
    set(_CONAN_PKG_LIBS_LUAU_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LUAU_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LUAU_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LUAU_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LUAU_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LUAU_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LUAU_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LUAU_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LUAU_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" luau)
    set(_CONAN_PKG_LIBS_LUAU_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LUAU_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LUAU_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LUAU_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LUAU_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LUAU_MINSIZEREL}" "${CONAN_LIB_DIRS_LUAU_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LUAU_MINSIZEREL "${_CONAN_PKG_LIBS_LUAU_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" luau)

    add_library(CONAN_PKG::luau INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::luau PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LUAU} ${_CONAN_PKG_LIBS_LUAU_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LUAU_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LUAU_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LUAU_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LUAU_RELEASE} ${_CONAN_PKG_LIBS_LUAU_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LUAU_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LUAU_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LUAU_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LUAU_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LUAU_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LUAU_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LUAU_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LUAU_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LUAU_MINSIZEREL} ${_CONAN_PKG_LIBS_LUAU_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LUAU_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LUAU_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LUAU_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LUAU_DEBUG} ${_CONAN_PKG_LIBS_LUAU_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LUAU_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LUAU_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LUAU_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::luau PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LUAU}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LUAU_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LUAU_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LUAU_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LUAU_DEBUG}>)
    set_property(TARGET CONAN_PKG::luau PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LUAU}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LUAU_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LUAU_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LUAU_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LUAU_DEBUG}>)
    set_property(TARGET CONAN_PKG::luau PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LUAU_LIST} ${CONAN_CXX_FLAGS_LUAU_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LUAU_RELEASE_LIST} ${CONAN_CXX_FLAGS_LUAU_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LUAU_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LUAU_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LUAU_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LUAU_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LUAU_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LUAU_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES "${CONAN_SYSTEM_LIBS_OPENGL} ${CONAN_FRAMEWORKS_FOUND_OPENGL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENGL_DEPENDENCIES "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENGL}" "${CONAN_LIB_DIRS_OPENGL}"
                                  CONAN_PACKAGE_TARGETS_OPENGL "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES}"
                                  "" opengl)
    set(_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_OPENGL_DEBUG} ${CONAN_FRAMEWORKS_FOUND_OPENGL_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENGL_DEBUG}" "${CONAN_LIB_DIRS_OPENGL_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_OPENGL_DEBUG "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_DEBUG}"
                                  "debug" opengl)
    set(_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_OPENGL_RELEASE} ${CONAN_FRAMEWORKS_FOUND_OPENGL_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENGL_RELEASE}" "${CONAN_LIB_DIRS_OPENGL_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_OPENGL_RELEASE "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELEASE}"
                                  "release" opengl)
    set(_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_OPENGL_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_OPENGL_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENGL_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_OPENGL_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_OPENGL_RELWITHDEBINFO "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" opengl)
    set(_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_OPENGL_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_OPENGL_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENGL_MINSIZEREL}" "${CONAN_LIB_DIRS_OPENGL_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_OPENGL_MINSIZEREL "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" opengl)

    add_library(CONAN_PKG::opengl INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::opengl PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_OPENGL} ${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENGL_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_OPENGL_RELEASE} ${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENGL_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_OPENGL_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENGL_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_OPENGL_MINSIZEREL} ${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENGL_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_OPENGL_DEBUG} ${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENGL_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::opengl PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_OPENGL}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_OPENGL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_OPENGL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_OPENGL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_OPENGL_DEBUG}>)
    set_property(TARGET CONAN_PKG::opengl PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_OPENGL}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_OPENGL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_OPENGL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_OPENGL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_OPENGL_DEBUG}>)
    set_property(TARGET CONAN_PKG::opengl PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_OPENGL_LIST} ${CONAN_CXX_FLAGS_OPENGL_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_OPENGL_RELEASE_LIST} ${CONAN_CXX_FLAGS_OPENGL_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_OPENGL_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_OPENGL_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_OPENGL_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_OPENGL_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_OPENGL_DEBUG_LIST}  ${CONAN_CXX_FLAGS_OPENGL_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES "${CONAN_SYSTEM_LIBS_MINIZIP} ${CONAN_FRAMEWORKS_FOUND_MINIZIP} CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES "${_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_MINIZIP}" "${CONAN_LIB_DIRS_MINIZIP}"
                                  CONAN_PACKAGE_TARGETS_MINIZIP "${_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES}"
                                  "" minizip)
    set(_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_MINIZIP_DEBUG} ${CONAN_FRAMEWORKS_FOUND_MINIZIP_DEBUG} CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_MINIZIP_DEBUG}" "${CONAN_LIB_DIRS_MINIZIP_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_MINIZIP_DEBUG "${_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_DEBUG}"
                                  "debug" minizip)
    set(_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_MINIZIP_RELEASE} ${CONAN_FRAMEWORKS_FOUND_MINIZIP_RELEASE} CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_MINIZIP_RELEASE}" "${CONAN_LIB_DIRS_MINIZIP_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_MINIZIP_RELEASE "${_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_RELEASE}"
                                  "release" minizip)
    set(_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_MINIZIP_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_MINIZIP_RELWITHDEBINFO} CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_MINIZIP_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_MINIZIP_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_MINIZIP_RELWITHDEBINFO "${_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" minizip)
    set(_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_MINIZIP_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_MINIZIP_MINSIZEREL} CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_MINIZIP_MINSIZEREL}" "${CONAN_LIB_DIRS_MINIZIP_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_MINIZIP_MINSIZEREL "${_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" minizip)

    add_library(CONAN_PKG::minizip INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::minizip PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_MINIZIP} ${_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_MINIZIP_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_MINIZIP_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_MINIZIP_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_MINIZIP_RELEASE} ${_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_MINIZIP_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_MINIZIP_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_MINIZIP_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_MINIZIP_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_MINIZIP_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_MINIZIP_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_MINIZIP_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_MINIZIP_MINSIZEREL} ${_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_MINIZIP_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_MINIZIP_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_MINIZIP_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_MINIZIP_DEBUG} ${_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_MINIZIP_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_MINIZIP_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_MINIZIP_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::minizip PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_MINIZIP}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_MINIZIP_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_MINIZIP_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_MINIZIP_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_MINIZIP_DEBUG}>)
    set_property(TARGET CONAN_PKG::minizip PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_MINIZIP}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_MINIZIP_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_MINIZIP_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_MINIZIP_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_MINIZIP_DEBUG}>)
    set_property(TARGET CONAN_PKG::minizip PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_MINIZIP_LIST} ${CONAN_CXX_FLAGS_MINIZIP_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_MINIZIP_RELEASE_LIST} ${CONAN_CXX_FLAGS_MINIZIP_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_MINIZIP_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_MINIZIP_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_MINIZIP_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_MINIZIP_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_MINIZIP_DEBUG_LIST}  ${CONAN_CXX_FLAGS_MINIZIP_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES "${CONAN_SYSTEM_LIBS_UTFCPP} ${CONAN_FRAMEWORKS_FOUND_UTFCPP} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES "${_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_UTFCPP}" "${CONAN_LIB_DIRS_UTFCPP}"
                                  CONAN_PACKAGE_TARGETS_UTFCPP "${_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES}"
                                  "" utfcpp)
    set(_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_UTFCPP_DEBUG} ${CONAN_FRAMEWORKS_FOUND_UTFCPP_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_UTFCPP_DEBUG}" "${CONAN_LIB_DIRS_UTFCPP_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_UTFCPP_DEBUG "${_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_DEBUG}"
                                  "debug" utfcpp)
    set(_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_UTFCPP_RELEASE} ${CONAN_FRAMEWORKS_FOUND_UTFCPP_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_UTFCPP_RELEASE}" "${CONAN_LIB_DIRS_UTFCPP_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_UTFCPP_RELEASE "${_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_RELEASE}"
                                  "release" utfcpp)
    set(_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_UTFCPP_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_UTFCPP_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_UTFCPP_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_UTFCPP_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_UTFCPP_RELWITHDEBINFO "${_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" utfcpp)
    set(_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_UTFCPP_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_UTFCPP_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_UTFCPP_MINSIZEREL}" "${CONAN_LIB_DIRS_UTFCPP_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_UTFCPP_MINSIZEREL "${_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" utfcpp)

    add_library(CONAN_PKG::utfcpp INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::utfcpp PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_UTFCPP} ${_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_UTFCPP_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_UTFCPP_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_UTFCPP_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_UTFCPP_RELEASE} ${_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_UTFCPP_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_UTFCPP_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_UTFCPP_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_UTFCPP_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_UTFCPP_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_UTFCPP_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_UTFCPP_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_UTFCPP_MINSIZEREL} ${_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_UTFCPP_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_UTFCPP_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_UTFCPP_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_UTFCPP_DEBUG} ${_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_UTFCPP_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_UTFCPP_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_UTFCPP_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::utfcpp PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_UTFCPP}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_UTFCPP_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_UTFCPP_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_UTFCPP_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_UTFCPP_DEBUG}>)
    set_property(TARGET CONAN_PKG::utfcpp PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_UTFCPP}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_UTFCPP_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_UTFCPP_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_UTFCPP_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_UTFCPP_DEBUG}>)
    set_property(TARGET CONAN_PKG::utfcpp PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_UTFCPP_LIST} ${CONAN_CXX_FLAGS_UTFCPP_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_UTFCPP_RELEASE_LIST} ${CONAN_CXX_FLAGS_UTFCPP_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_UTFCPP_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_UTFCPP_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_UTFCPP_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_UTFCPP_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_UTFCPP_DEBUG_LIST}  ${CONAN_CXX_FLAGS_UTFCPP_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES "${CONAN_SYSTEM_LIBS_PUGIXML} ${CONAN_FRAMEWORKS_FOUND_PUGIXML} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES "${_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PUGIXML}" "${CONAN_LIB_DIRS_PUGIXML}"
                                  CONAN_PACKAGE_TARGETS_PUGIXML "${_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES}"
                                  "" pugixml)
    set(_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_PUGIXML_DEBUG} ${CONAN_FRAMEWORKS_FOUND_PUGIXML_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PUGIXML_DEBUG}" "${CONAN_LIB_DIRS_PUGIXML_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_PUGIXML_DEBUG "${_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_DEBUG}"
                                  "debug" pugixml)
    set(_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_PUGIXML_RELEASE} ${CONAN_FRAMEWORKS_FOUND_PUGIXML_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PUGIXML_RELEASE}" "${CONAN_LIB_DIRS_PUGIXML_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_PUGIXML_RELEASE "${_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_RELEASE}"
                                  "release" pugixml)
    set(_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_PUGIXML_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_PUGIXML_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PUGIXML_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_PUGIXML_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_PUGIXML_RELWITHDEBINFO "${_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" pugixml)
    set(_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_PUGIXML_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_PUGIXML_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PUGIXML_MINSIZEREL}" "${CONAN_LIB_DIRS_PUGIXML_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_PUGIXML_MINSIZEREL "${_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" pugixml)

    add_library(CONAN_PKG::pugixml INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::pugixml PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_PUGIXML} ${_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PUGIXML_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PUGIXML_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PUGIXML_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_PUGIXML_RELEASE} ${_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PUGIXML_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PUGIXML_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PUGIXML_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_PUGIXML_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PUGIXML_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PUGIXML_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PUGIXML_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_PUGIXML_MINSIZEREL} ${_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PUGIXML_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PUGIXML_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PUGIXML_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_PUGIXML_DEBUG} ${_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PUGIXML_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PUGIXML_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PUGIXML_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::pugixml PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_PUGIXML}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_PUGIXML_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_PUGIXML_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_PUGIXML_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_PUGIXML_DEBUG}>)
    set_property(TARGET CONAN_PKG::pugixml PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_PUGIXML}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_PUGIXML_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_PUGIXML_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_PUGIXML_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_PUGIXML_DEBUG}>)
    set_property(TARGET CONAN_PKG::pugixml PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_PUGIXML_LIST} ${CONAN_CXX_FLAGS_PUGIXML_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_PUGIXML_RELEASE_LIST} ${CONAN_CXX_FLAGS_PUGIXML_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_PUGIXML_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_PUGIXML_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_PUGIXML_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_PUGIXML_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_PUGIXML_DEBUG_LIST}  ${CONAN_CXX_FLAGS_PUGIXML_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES "${CONAN_SYSTEM_LIBS_KUBA-ZIP} ${CONAN_FRAMEWORKS_FOUND_KUBA-ZIP} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES "${_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_KUBA-ZIP}" "${CONAN_LIB_DIRS_KUBA-ZIP}"
                                  CONAN_PACKAGE_TARGETS_KUBA-ZIP "${_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES}"
                                  "" kuba-zip)
    set(_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_KUBA-ZIP_DEBUG} ${CONAN_FRAMEWORKS_FOUND_KUBA-ZIP_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_KUBA-ZIP_DEBUG}" "${CONAN_LIB_DIRS_KUBA-ZIP_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_KUBA-ZIP_DEBUG "${_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_DEBUG}"
                                  "debug" kuba-zip)
    set(_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_KUBA-ZIP_RELEASE} ${CONAN_FRAMEWORKS_FOUND_KUBA-ZIP_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_KUBA-ZIP_RELEASE}" "${CONAN_LIB_DIRS_KUBA-ZIP_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_KUBA-ZIP_RELEASE "${_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_RELEASE}"
                                  "release" kuba-zip)
    set(_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_KUBA-ZIP_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_KUBA-ZIP_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_KUBA-ZIP_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_KUBA-ZIP_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_KUBA-ZIP_RELWITHDEBINFO "${_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" kuba-zip)
    set(_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_KUBA-ZIP_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_KUBA-ZIP_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_KUBA-ZIP_MINSIZEREL}" "${CONAN_LIB_DIRS_KUBA-ZIP_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_KUBA-ZIP_MINSIZEREL "${_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" kuba-zip)

    add_library(CONAN_PKG::kuba-zip INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::kuba-zip PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_KUBA-ZIP} ${_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_KUBA-ZIP_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_KUBA-ZIP_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_KUBA-ZIP_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_KUBA-ZIP_RELEASE} ${_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_KUBA-ZIP_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_KUBA-ZIP_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_KUBA-ZIP_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_KUBA-ZIP_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_KUBA-ZIP_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_KUBA-ZIP_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_KUBA-ZIP_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_KUBA-ZIP_MINSIZEREL} ${_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_KUBA-ZIP_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_KUBA-ZIP_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_KUBA-ZIP_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_KUBA-ZIP_DEBUG} ${_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_KUBA-ZIP_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_KUBA-ZIP_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_KUBA-ZIP_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::kuba-zip PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_KUBA-ZIP}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_KUBA-ZIP_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_KUBA-ZIP_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_KUBA-ZIP_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_KUBA-ZIP_DEBUG}>)
    set_property(TARGET CONAN_PKG::kuba-zip PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_KUBA-ZIP}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_KUBA-ZIP_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_KUBA-ZIP_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_KUBA-ZIP_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_KUBA-ZIP_DEBUG}>)
    set_property(TARGET CONAN_PKG::kuba-zip PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_KUBA-ZIP_LIST} ${CONAN_CXX_FLAGS_KUBA-ZIP_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_KUBA-ZIP_RELEASE_LIST} ${CONAN_CXX_FLAGS_KUBA-ZIP_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_KUBA-ZIP_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_KUBA-ZIP_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_KUBA-ZIP_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_KUBA-ZIP_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_KUBA-ZIP_DEBUG_LIST}  ${CONAN_CXX_FLAGS_KUBA-ZIP_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES "${CONAN_SYSTEM_LIBS_POLY2TRI} ${CONAN_FRAMEWORKS_FOUND_POLY2TRI} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES "${_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_POLY2TRI}" "${CONAN_LIB_DIRS_POLY2TRI}"
                                  CONAN_PACKAGE_TARGETS_POLY2TRI "${_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES}"
                                  "" poly2tri)
    set(_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_POLY2TRI_DEBUG} ${CONAN_FRAMEWORKS_FOUND_POLY2TRI_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_POLY2TRI_DEBUG}" "${CONAN_LIB_DIRS_POLY2TRI_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_POLY2TRI_DEBUG "${_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_DEBUG}"
                                  "debug" poly2tri)
    set(_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_POLY2TRI_RELEASE} ${CONAN_FRAMEWORKS_FOUND_POLY2TRI_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_POLY2TRI_RELEASE}" "${CONAN_LIB_DIRS_POLY2TRI_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_POLY2TRI_RELEASE "${_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_RELEASE}"
                                  "release" poly2tri)
    set(_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_POLY2TRI_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_POLY2TRI_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_POLY2TRI_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_POLY2TRI_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_POLY2TRI_RELWITHDEBINFO "${_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" poly2tri)
    set(_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_POLY2TRI_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_POLY2TRI_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_POLY2TRI_MINSIZEREL}" "${CONAN_LIB_DIRS_POLY2TRI_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_POLY2TRI_MINSIZEREL "${_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" poly2tri)

    add_library(CONAN_PKG::poly2tri INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::poly2tri PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_POLY2TRI} ${_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_POLY2TRI_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_POLY2TRI_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_POLY2TRI_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_POLY2TRI_RELEASE} ${_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_POLY2TRI_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_POLY2TRI_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_POLY2TRI_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_POLY2TRI_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_POLY2TRI_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_POLY2TRI_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_POLY2TRI_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_POLY2TRI_MINSIZEREL} ${_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_POLY2TRI_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_POLY2TRI_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_POLY2TRI_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_POLY2TRI_DEBUG} ${_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_POLY2TRI_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_POLY2TRI_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_POLY2TRI_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::poly2tri PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_POLY2TRI}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_POLY2TRI_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_POLY2TRI_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_POLY2TRI_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_POLY2TRI_DEBUG}>)
    set_property(TARGET CONAN_PKG::poly2tri PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_POLY2TRI}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_POLY2TRI_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_POLY2TRI_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_POLY2TRI_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_POLY2TRI_DEBUG}>)
    set_property(TARGET CONAN_PKG::poly2tri PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_POLY2TRI_LIST} ${CONAN_CXX_FLAGS_POLY2TRI_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_POLY2TRI_RELEASE_LIST} ${CONAN_CXX_FLAGS_POLY2TRI_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_POLY2TRI_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_POLY2TRI_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_POLY2TRI_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_POLY2TRI_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_POLY2TRI_DEBUG_LIST}  ${CONAN_CXX_FLAGS_POLY2TRI_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES "${CONAN_SYSTEM_LIBS_RAPIDJSON} ${CONAN_FRAMEWORKS_FOUND_RAPIDJSON} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES "${_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_RAPIDJSON}" "${CONAN_LIB_DIRS_RAPIDJSON}"
                                  CONAN_PACKAGE_TARGETS_RAPIDJSON "${_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES}"
                                  "" rapidjson)
    set(_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_RAPIDJSON_DEBUG} ${CONAN_FRAMEWORKS_FOUND_RAPIDJSON_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_RAPIDJSON_DEBUG}" "${CONAN_LIB_DIRS_RAPIDJSON_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_RAPIDJSON_DEBUG "${_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_DEBUG}"
                                  "debug" rapidjson)
    set(_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_RAPIDJSON_RELEASE} ${CONAN_FRAMEWORKS_FOUND_RAPIDJSON_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_RAPIDJSON_RELEASE}" "${CONAN_LIB_DIRS_RAPIDJSON_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_RAPIDJSON_RELEASE "${_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_RELEASE}"
                                  "release" rapidjson)
    set(_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_RAPIDJSON_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_RAPIDJSON_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_RAPIDJSON_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_RAPIDJSON_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_RAPIDJSON_RELWITHDEBINFO "${_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" rapidjson)
    set(_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_RAPIDJSON_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_RAPIDJSON_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_RAPIDJSON_MINSIZEREL}" "${CONAN_LIB_DIRS_RAPIDJSON_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_RAPIDJSON_MINSIZEREL "${_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" rapidjson)

    add_library(CONAN_PKG::rapidjson INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::rapidjson PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_RAPIDJSON} ${_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RAPIDJSON_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RAPIDJSON_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_RAPIDJSON_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_RAPIDJSON_RELEASE} ${_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RAPIDJSON_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RAPIDJSON_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_RAPIDJSON_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_RAPIDJSON_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RAPIDJSON_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RAPIDJSON_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_RAPIDJSON_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_RAPIDJSON_MINSIZEREL} ${_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RAPIDJSON_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RAPIDJSON_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_RAPIDJSON_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_RAPIDJSON_DEBUG} ${_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RAPIDJSON_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RAPIDJSON_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_RAPIDJSON_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::rapidjson PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_RAPIDJSON}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_RAPIDJSON_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_RAPIDJSON_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_RAPIDJSON_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_RAPIDJSON_DEBUG}>)
    set_property(TARGET CONAN_PKG::rapidjson PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_RAPIDJSON}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_RAPIDJSON_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_RAPIDJSON_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_RAPIDJSON_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_RAPIDJSON_DEBUG}>)
    set_property(TARGET CONAN_PKG::rapidjson PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_RAPIDJSON_LIST} ${CONAN_CXX_FLAGS_RAPIDJSON_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_RAPIDJSON_RELEASE_LIST} ${CONAN_CXX_FLAGS_RAPIDJSON_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_RAPIDJSON_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_RAPIDJSON_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_RAPIDJSON_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_RAPIDJSON_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_RAPIDJSON_DEBUG_LIST}  ${CONAN_CXX_FLAGS_RAPIDJSON_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_DRACO_DEPENDENCIES "${CONAN_SYSTEM_LIBS_DRACO} ${CONAN_FRAMEWORKS_FOUND_DRACO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DRACO_DEPENDENCIES "${_CONAN_PKG_LIBS_DRACO_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DRACO}" "${CONAN_LIB_DIRS_DRACO}"
                                  CONAN_PACKAGE_TARGETS_DRACO "${_CONAN_PKG_LIBS_DRACO_DEPENDENCIES}"
                                  "" draco)
    set(_CONAN_PKG_LIBS_DRACO_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_DRACO_DEBUG} ${CONAN_FRAMEWORKS_FOUND_DRACO_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DRACO_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_DRACO_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DRACO_DEBUG}" "${CONAN_LIB_DIRS_DRACO_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_DRACO_DEBUG "${_CONAN_PKG_LIBS_DRACO_DEPENDENCIES_DEBUG}"
                                  "debug" draco)
    set(_CONAN_PKG_LIBS_DRACO_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_DRACO_RELEASE} ${CONAN_FRAMEWORKS_FOUND_DRACO_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DRACO_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_DRACO_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DRACO_RELEASE}" "${CONAN_LIB_DIRS_DRACO_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_DRACO_RELEASE "${_CONAN_PKG_LIBS_DRACO_DEPENDENCIES_RELEASE}"
                                  "release" draco)
    set(_CONAN_PKG_LIBS_DRACO_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_DRACO_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_DRACO_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DRACO_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_DRACO_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DRACO_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_DRACO_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_DRACO_RELWITHDEBINFO "${_CONAN_PKG_LIBS_DRACO_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" draco)
    set(_CONAN_PKG_LIBS_DRACO_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_DRACO_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_DRACO_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DRACO_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_DRACO_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DRACO_MINSIZEREL}" "${CONAN_LIB_DIRS_DRACO_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_DRACO_MINSIZEREL "${_CONAN_PKG_LIBS_DRACO_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" draco)

    add_library(CONAN_PKG::draco INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::draco PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_DRACO} ${_CONAN_PKG_LIBS_DRACO_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DRACO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DRACO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DRACO_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_DRACO_RELEASE} ${_CONAN_PKG_LIBS_DRACO_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DRACO_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DRACO_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DRACO_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_DRACO_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_DRACO_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DRACO_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DRACO_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DRACO_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_DRACO_MINSIZEREL} ${_CONAN_PKG_LIBS_DRACO_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DRACO_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DRACO_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DRACO_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_DRACO_DEBUG} ${_CONAN_PKG_LIBS_DRACO_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DRACO_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DRACO_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DRACO_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::draco PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_DRACO}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_DRACO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_DRACO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_DRACO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_DRACO_DEBUG}>)
    set_property(TARGET CONAN_PKG::draco PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_DRACO}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_DRACO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_DRACO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_DRACO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_DRACO_DEBUG}>)
    set_property(TARGET CONAN_PKG::draco PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_DRACO_LIST} ${CONAN_CXX_FLAGS_DRACO_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_DRACO_RELEASE_LIST} ${CONAN_CXX_FLAGS_DRACO_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_DRACO_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_DRACO_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_DRACO_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_DRACO_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_DRACO_DEBUG_LIST}  ${CONAN_CXX_FLAGS_DRACO_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_CLIPPER_DEPENDENCIES "${CONAN_SYSTEM_LIBS_CLIPPER} ${CONAN_FRAMEWORKS_FOUND_CLIPPER} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_CLIPPER_DEPENDENCIES "${_CONAN_PKG_LIBS_CLIPPER_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_CLIPPER}" "${CONAN_LIB_DIRS_CLIPPER}"
                                  CONAN_PACKAGE_TARGETS_CLIPPER "${_CONAN_PKG_LIBS_CLIPPER_DEPENDENCIES}"
                                  "" clipper)
    set(_CONAN_PKG_LIBS_CLIPPER_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_CLIPPER_DEBUG} ${CONAN_FRAMEWORKS_FOUND_CLIPPER_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_CLIPPER_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_CLIPPER_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_CLIPPER_DEBUG}" "${CONAN_LIB_DIRS_CLIPPER_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_CLIPPER_DEBUG "${_CONAN_PKG_LIBS_CLIPPER_DEPENDENCIES_DEBUG}"
                                  "debug" clipper)
    set(_CONAN_PKG_LIBS_CLIPPER_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_CLIPPER_RELEASE} ${CONAN_FRAMEWORKS_FOUND_CLIPPER_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_CLIPPER_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_CLIPPER_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_CLIPPER_RELEASE}" "${CONAN_LIB_DIRS_CLIPPER_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_CLIPPER_RELEASE "${_CONAN_PKG_LIBS_CLIPPER_DEPENDENCIES_RELEASE}"
                                  "release" clipper)
    set(_CONAN_PKG_LIBS_CLIPPER_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_CLIPPER_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_CLIPPER_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_CLIPPER_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_CLIPPER_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_CLIPPER_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_CLIPPER_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_CLIPPER_RELWITHDEBINFO "${_CONAN_PKG_LIBS_CLIPPER_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" clipper)
    set(_CONAN_PKG_LIBS_CLIPPER_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_CLIPPER_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_CLIPPER_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_CLIPPER_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_CLIPPER_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_CLIPPER_MINSIZEREL}" "${CONAN_LIB_DIRS_CLIPPER_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_CLIPPER_MINSIZEREL "${_CONAN_PKG_LIBS_CLIPPER_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" clipper)

    add_library(CONAN_PKG::clipper INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::clipper PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_CLIPPER} ${_CONAN_PKG_LIBS_CLIPPER_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_CLIPPER_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_CLIPPER_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_CLIPPER_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_CLIPPER_RELEASE} ${_CONAN_PKG_LIBS_CLIPPER_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_CLIPPER_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_CLIPPER_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_CLIPPER_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_CLIPPER_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_CLIPPER_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_CLIPPER_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_CLIPPER_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_CLIPPER_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_CLIPPER_MINSIZEREL} ${_CONAN_PKG_LIBS_CLIPPER_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_CLIPPER_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_CLIPPER_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_CLIPPER_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_CLIPPER_DEBUG} ${_CONAN_PKG_LIBS_CLIPPER_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_CLIPPER_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_CLIPPER_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_CLIPPER_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::clipper PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_CLIPPER}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_CLIPPER_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_CLIPPER_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_CLIPPER_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_CLIPPER_DEBUG}>)
    set_property(TARGET CONAN_PKG::clipper PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_CLIPPER}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_CLIPPER_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_CLIPPER_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_CLIPPER_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_CLIPPER_DEBUG}>)
    set_property(TARGET CONAN_PKG::clipper PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_CLIPPER_LIST} ${CONAN_CXX_FLAGS_CLIPPER_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_CLIPPER_RELEASE_LIST} ${CONAN_CXX_FLAGS_CLIPPER_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_CLIPPER_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_CLIPPER_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_CLIPPER_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_CLIPPER_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_CLIPPER_DEBUG_LIST}  ${CONAN_CXX_FLAGS_CLIPPER_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_STB_DEPENDENCIES "${CONAN_SYSTEM_LIBS_STB} ${CONAN_FRAMEWORKS_FOUND_STB} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_STB_DEPENDENCIES "${_CONAN_PKG_LIBS_STB_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_STB}" "${CONAN_LIB_DIRS_STB}"
                                  CONAN_PACKAGE_TARGETS_STB "${_CONAN_PKG_LIBS_STB_DEPENDENCIES}"
                                  "" stb)
    set(_CONAN_PKG_LIBS_STB_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_STB_DEBUG} ${CONAN_FRAMEWORKS_FOUND_STB_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_STB_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_STB_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_STB_DEBUG}" "${CONAN_LIB_DIRS_STB_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_STB_DEBUG "${_CONAN_PKG_LIBS_STB_DEPENDENCIES_DEBUG}"
                                  "debug" stb)
    set(_CONAN_PKG_LIBS_STB_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_STB_RELEASE} ${CONAN_FRAMEWORKS_FOUND_STB_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_STB_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_STB_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_STB_RELEASE}" "${CONAN_LIB_DIRS_STB_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_STB_RELEASE "${_CONAN_PKG_LIBS_STB_DEPENDENCIES_RELEASE}"
                                  "release" stb)
    set(_CONAN_PKG_LIBS_STB_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_STB_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_STB_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_STB_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_STB_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_STB_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_STB_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_STB_RELWITHDEBINFO "${_CONAN_PKG_LIBS_STB_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" stb)
    set(_CONAN_PKG_LIBS_STB_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_STB_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_STB_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_STB_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_STB_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_STB_MINSIZEREL}" "${CONAN_LIB_DIRS_STB_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_STB_MINSIZEREL "${_CONAN_PKG_LIBS_STB_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" stb)

    add_library(CONAN_PKG::stb INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::stb PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_STB} ${_CONAN_PKG_LIBS_STB_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_STB_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_STB_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_STB_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_STB_RELEASE} ${_CONAN_PKG_LIBS_STB_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_STB_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_STB_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_STB_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_STB_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_STB_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_STB_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_STB_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_STB_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_STB_MINSIZEREL} ${_CONAN_PKG_LIBS_STB_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_STB_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_STB_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_STB_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_STB_DEBUG} ${_CONAN_PKG_LIBS_STB_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_STB_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_STB_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_STB_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::stb PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_STB}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_STB_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_STB_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_STB_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_STB_DEBUG}>)
    set_property(TARGET CONAN_PKG::stb PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_STB}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_STB_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_STB_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_STB_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_STB_DEBUG}>)
    set_property(TARGET CONAN_PKG::stb PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_STB_LIST} ${CONAN_CXX_FLAGS_STB_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_STB_RELEASE_LIST} ${CONAN_CXX_FLAGS_STB_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_STB_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_STB_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_STB_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_STB_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_STB_DEBUG_LIST}  ${CONAN_CXX_FLAGS_STB_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_OPENDDL-PARSER_DEPENDENCIES "${CONAN_SYSTEM_LIBS_OPENDDL-PARSER} ${CONAN_FRAMEWORKS_FOUND_OPENDDL-PARSER} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENDDL-PARSER_DEPENDENCIES "${_CONAN_PKG_LIBS_OPENDDL-PARSER_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENDDL-PARSER}" "${CONAN_LIB_DIRS_OPENDDL-PARSER}"
                                  CONAN_PACKAGE_TARGETS_OPENDDL-PARSER "${_CONAN_PKG_LIBS_OPENDDL-PARSER_DEPENDENCIES}"
                                  "" openddl-parser)
    set(_CONAN_PKG_LIBS_OPENDDL-PARSER_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_OPENDDL-PARSER_DEBUG} ${CONAN_FRAMEWORKS_FOUND_OPENDDL-PARSER_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENDDL-PARSER_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_OPENDDL-PARSER_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENDDL-PARSER_DEBUG}" "${CONAN_LIB_DIRS_OPENDDL-PARSER_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_OPENDDL-PARSER_DEBUG "${_CONAN_PKG_LIBS_OPENDDL-PARSER_DEPENDENCIES_DEBUG}"
                                  "debug" openddl-parser)
    set(_CONAN_PKG_LIBS_OPENDDL-PARSER_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_OPENDDL-PARSER_RELEASE} ${CONAN_FRAMEWORKS_FOUND_OPENDDL-PARSER_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENDDL-PARSER_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_OPENDDL-PARSER_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENDDL-PARSER_RELEASE}" "${CONAN_LIB_DIRS_OPENDDL-PARSER_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_OPENDDL-PARSER_RELEASE "${_CONAN_PKG_LIBS_OPENDDL-PARSER_DEPENDENCIES_RELEASE}"
                                  "release" openddl-parser)
    set(_CONAN_PKG_LIBS_OPENDDL-PARSER_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_OPENDDL-PARSER_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_OPENDDL-PARSER_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENDDL-PARSER_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_OPENDDL-PARSER_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENDDL-PARSER_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_OPENDDL-PARSER_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_OPENDDL-PARSER_RELWITHDEBINFO "${_CONAN_PKG_LIBS_OPENDDL-PARSER_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" openddl-parser)
    set(_CONAN_PKG_LIBS_OPENDDL-PARSER_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_OPENDDL-PARSER_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_OPENDDL-PARSER_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENDDL-PARSER_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_OPENDDL-PARSER_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENDDL-PARSER_MINSIZEREL}" "${CONAN_LIB_DIRS_OPENDDL-PARSER_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_OPENDDL-PARSER_MINSIZEREL "${_CONAN_PKG_LIBS_OPENDDL-PARSER_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" openddl-parser)

    add_library(CONAN_PKG::openddl-parser INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::openddl-parser PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_OPENDDL-PARSER} ${_CONAN_PKG_LIBS_OPENDDL-PARSER_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENDDL-PARSER_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENDDL-PARSER_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENDDL-PARSER_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_OPENDDL-PARSER_RELEASE} ${_CONAN_PKG_LIBS_OPENDDL-PARSER_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENDDL-PARSER_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENDDL-PARSER_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENDDL-PARSER_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_OPENDDL-PARSER_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_OPENDDL-PARSER_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENDDL-PARSER_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENDDL-PARSER_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENDDL-PARSER_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_OPENDDL-PARSER_MINSIZEREL} ${_CONAN_PKG_LIBS_OPENDDL-PARSER_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENDDL-PARSER_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENDDL-PARSER_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENDDL-PARSER_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_OPENDDL-PARSER_DEBUG} ${_CONAN_PKG_LIBS_OPENDDL-PARSER_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENDDL-PARSER_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENDDL-PARSER_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENDDL-PARSER_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::openddl-parser PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_OPENDDL-PARSER}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_OPENDDL-PARSER_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_OPENDDL-PARSER_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_OPENDDL-PARSER_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_OPENDDL-PARSER_DEBUG}>)
    set_property(TARGET CONAN_PKG::openddl-parser PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_OPENDDL-PARSER}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_OPENDDL-PARSER_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_OPENDDL-PARSER_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_OPENDDL-PARSER_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_OPENDDL-PARSER_DEBUG}>)
    set_property(TARGET CONAN_PKG::openddl-parser PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_OPENDDL-PARSER_LIST} ${CONAN_CXX_FLAGS_OPENDDL-PARSER_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_OPENDDL-PARSER_RELEASE_LIST} ${CONAN_CXX_FLAGS_OPENDDL-PARSER_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_OPENDDL-PARSER_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_OPENDDL-PARSER_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_OPENDDL-PARSER_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_OPENDDL-PARSER_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_OPENDDL-PARSER_DEBUG_LIST}  ${CONAN_CXX_FLAGS_OPENDDL-PARSER_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES "${CONAN_SYSTEM_LIBS_ZLIB} ${CONAN_FRAMEWORKS_FOUND_ZLIB} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB}" "${CONAN_LIB_DIRS_ZLIB}"
                                  CONAN_PACKAGE_TARGETS_ZLIB "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES}"
                                  "" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_ZLIB_DEBUG} ${CONAN_FRAMEWORKS_FOUND_ZLIB_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_DEBUG}" "${CONAN_LIB_DIRS_ZLIB_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_DEBUG "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG}"
                                  "debug" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_ZLIB_RELEASE} ${CONAN_FRAMEWORKS_FOUND_ZLIB_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_RELEASE}" "${CONAN_LIB_DIRS_ZLIB_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_RELEASE "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE}"
                                  "release" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_ZLIB_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_ZLIB_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_ZLIB_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_ZLIB_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_ZLIB_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_MINSIZEREL}" "${CONAN_LIB_DIRS_ZLIB_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_MINSIZEREL "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" zlib)

    add_library(CONAN_PKG::zlib INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_ZLIB} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_ZLIB_RELEASE} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_ZLIB_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_ZLIB_MINSIZEREL} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_ZLIB_DEBUG} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_ZLIB}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_ZLIB_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_ZLIB_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_ZLIB_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_ZLIB_DEBUG}>)
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_ZLIB}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_ZLIB_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_ZLIB_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_ZLIB_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_ZLIB_DEBUG}>)
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_ZLIB_LIST} ${CONAN_CXX_FLAGS_ZLIB_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_ZLIB_RELEASE_LIST} ${CONAN_CXX_FLAGS_ZLIB_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_ZLIB_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_ZLIB_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_ZLIB_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_ZLIB_DEBUG_LIST}  ${CONAN_CXX_FLAGS_ZLIB_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES "${CONAN_SYSTEM_LIBS_BZIP2} ${CONAN_FRAMEWORKS_FOUND_BZIP2} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2}" "${CONAN_LIB_DIRS_BZIP2}"
                                  CONAN_PACKAGE_TARGETS_BZIP2 "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES}"
                                  "" bzip2)
    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_BZIP2_DEBUG} ${CONAN_FRAMEWORKS_FOUND_BZIP2_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2_DEBUG}" "${CONAN_LIB_DIRS_BZIP2_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BZIP2_DEBUG "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG}"
                                  "debug" bzip2)
    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_BZIP2_RELEASE} ${CONAN_FRAMEWORKS_FOUND_BZIP2_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2_RELEASE}" "${CONAN_LIB_DIRS_BZIP2_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BZIP2_RELEASE "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE}"
                                  "release" bzip2)
    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BZIP2_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_BZIP2_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BZIP2_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BZIP2_RELWITHDEBINFO "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" bzip2)
    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_BZIP2_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_BZIP2_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2_MINSIZEREL}" "${CONAN_LIB_DIRS_BZIP2_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BZIP2_MINSIZEREL "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" bzip2)

    add_library(CONAN_PKG::bzip2 INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::bzip2 PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BZIP2} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BZIP2_RELEASE} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BZIP2_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BZIP2_MINSIZEREL} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BZIP2_DEBUG} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::bzip2 PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BZIP2}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BZIP2_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BZIP2_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BZIP2_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BZIP2_DEBUG}>)
    set_property(TARGET CONAN_PKG::bzip2 PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BZIP2}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BZIP2_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BZIP2_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BZIP2_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BZIP2_DEBUG}>)
    set_property(TARGET CONAN_PKG::bzip2 PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BZIP2_LIST} ${CONAN_CXX_FLAGS_BZIP2_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BZIP2_RELEASE_LIST} ${CONAN_CXX_FLAGS_BZIP2_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BZIP2_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BZIP2_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BZIP2_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BZIP2_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BZIP2_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BZIP2_DEBUG_LIST}>)

    set(CONAN_TARGETS CONAN_PKG::glad CONAN_PKG::glfw CONAN_PKG::flecs CONAN_PKG::tl-expected CONAN_PKG::assimp CONAN_PKG::glm CONAN_PKG::luau CONAN_PKG::opengl CONAN_PKG::minizip CONAN_PKG::utfcpp CONAN_PKG::pugixml CONAN_PKG::kuba-zip CONAN_PKG::poly2tri CONAN_PKG::rapidjson CONAN_PKG::draco CONAN_PKG::clipper CONAN_PKG::stb CONAN_PKG::openddl-parser CONAN_PKG::zlib CONAN_PKG::bzip2)

endmacro()


macro(conan_basic_setup)
    set(options TARGETS NO_OUTPUT_DIRS SKIP_RPATH KEEP_RPATHS SKIP_STD SKIP_FPIC)
    cmake_parse_arguments(ARGUMENTS "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN} )

    if(CONAN_EXPORTED)
        conan_message(STATUS "Conan: called by CMake conan helper")
    endif()

    if(CONAN_IN_LOCAL_CACHE)
        conan_message(STATUS "Conan: called inside local cache")
    endif()

    if(NOT ARGUMENTS_NO_OUTPUT_DIRS)
        conan_message(STATUS "Conan: Adjusting output directories")
        conan_output_dirs_setup()
    endif()

    if(NOT ARGUMENTS_TARGETS)
        conan_message(STATUS "Conan: Using cmake global configuration")
        conan_global_flags()
    else()
        conan_message(STATUS "Conan: Using cmake targets configuration")
        conan_define_targets()
    endif()

    if(ARGUMENTS_SKIP_RPATH)
        # Change by "DEPRECATION" or "SEND_ERROR" when we are ready
        conan_message(WARNING "Conan: SKIP_RPATH is deprecated, it has been renamed to KEEP_RPATHS")
    endif()

    if(NOT ARGUMENTS_SKIP_RPATH AND NOT ARGUMENTS_KEEP_RPATHS)
        # Parameter has renamed, but we keep the compatibility with old SKIP_RPATH
        conan_set_rpath()
    endif()

    if(NOT ARGUMENTS_SKIP_STD)
        conan_set_std()
    endif()

    if(NOT ARGUMENTS_SKIP_FPIC)
        conan_set_fpic()
    endif()

    conan_check_compiler()
    conan_set_libcxx()
    conan_set_vs_runtime()
    conan_set_find_paths()
    conan_include_build_modules()
    conan_set_find_library_paths()
endmacro()


macro(conan_set_find_paths)
    # CMAKE_MODULE_PATH does not have Debug/Release config, but there are variables
    # CONAN_CMAKE_MODULE_PATH_DEBUG to be used by the consumer
    # CMake can find findXXX.cmake files in the root of packages
    set(CMAKE_MODULE_PATH ${CONAN_CMAKE_MODULE_PATH} ${CMAKE_MODULE_PATH})

    # Make find_package() to work
    set(CMAKE_PREFIX_PATH ${CONAN_CMAKE_MODULE_PATH} ${CMAKE_PREFIX_PATH})

    # Set the find root path (cross build)
    set(CMAKE_FIND_ROOT_PATH ${CONAN_CMAKE_FIND_ROOT_PATH} ${CMAKE_FIND_ROOT_PATH})
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_PROGRAM)
        set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_PROGRAM})
    endif()
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_LIBRARY)
        set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_LIBRARY})
    endif()
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_INCLUDE)
        set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_INCLUDE})
    endif()
endmacro()


macro(conan_set_find_library_paths)
    # CMAKE_INCLUDE_PATH, CMAKE_LIBRARY_PATH does not have Debug/Release config, but there are variables
    # CONAN_INCLUDE_DIRS_DEBUG/RELEASE CONAN_LIB_DIRS_DEBUG/RELEASE to be used by the consumer
    # For find_library
    set(CMAKE_INCLUDE_PATH ${CONAN_INCLUDE_DIRS} ${CMAKE_INCLUDE_PATH})
    set(CMAKE_LIBRARY_PATH ${CONAN_LIB_DIRS} ${CMAKE_LIBRARY_PATH})
endmacro()


macro(conan_set_vs_runtime)
    if(CONAN_LINK_RUNTIME)
        conan_get_policy(CMP0091 policy_0091)
        if(policy_0091 STREQUAL "NEW")
            if(CONAN_LINK_RUNTIME MATCHES "MTd")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDebug")
            elseif(CONAN_LINK_RUNTIME MATCHES "MDd")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDebugDLL")
            elseif(CONAN_LINK_RUNTIME MATCHES "MT")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded")
            elseif(CONAN_LINK_RUNTIME MATCHES "MD")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDLL")
            endif()
        else()
            foreach(flag CMAKE_C_FLAGS_RELEASE CMAKE_CXX_FLAGS_RELEASE
                         CMAKE_C_FLAGS_RELWITHDEBINFO CMAKE_CXX_FLAGS_RELWITHDEBINFO
                         CMAKE_C_FLAGS_MINSIZEREL CMAKE_CXX_FLAGS_MINSIZEREL)
                if(DEFINED ${flag})
                    string(REPLACE "/MD" ${CONAN_LINK_RUNTIME} ${flag} "${${flag}}")
                endif()
            endforeach()
            foreach(flag CMAKE_C_FLAGS_DEBUG CMAKE_CXX_FLAGS_DEBUG)
                if(DEFINED ${flag})
                    string(REPLACE "/MDd" ${CONAN_LINK_RUNTIME} ${flag} "${${flag}}")
                endif()
            endforeach()
        endif()
    endif()
endmacro()


macro(conan_flags_setup)
    # Macro maintained for backwards compatibility
    conan_set_find_library_paths()
    conan_global_flags()
    conan_set_rpath()
    conan_set_vs_runtime()
    conan_set_libcxx()
endmacro()


function(conan_message MESSAGE_OUTPUT)
    if(NOT CONAN_CMAKE_SILENT_OUTPUT)
        message(${ARGV${0}})
    endif()
endfunction()


function(conan_get_policy policy_id policy)
    if(POLICY "${policy_id}")
        cmake_policy(GET "${policy_id}" _policy)
        set(${policy} "${_policy}" PARENT_SCOPE)
    else()
        set(${policy} "" PARENT_SCOPE)
    endif()
endfunction()


function(conan_find_libraries_abs_path libraries package_libdir libraries_abs_path)
    foreach(_LIBRARY_NAME ${libraries})
        find_library(CONAN_FOUND_LIBRARY NAMES ${_LIBRARY_NAME} PATHS ${package_libdir}
                     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
        if(CONAN_FOUND_LIBRARY)
            conan_message(STATUS "Library ${_LIBRARY_NAME} found ${CONAN_FOUND_LIBRARY}")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${CONAN_FOUND_LIBRARY})
        else()
            conan_message(STATUS "Library ${_LIBRARY_NAME} not found in package, might be system one")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIBRARY_NAME})
        endif()
        unset(CONAN_FOUND_LIBRARY CACHE)
    endforeach()
    set(${libraries_abs_path} ${CONAN_FULLPATH_LIBS} PARENT_SCOPE)
endfunction()


function(conan_package_library_targets libraries package_libdir libraries_abs_path deps build_type package_name)
    unset(_CONAN_ACTUAL_TARGETS CACHE)
    unset(_CONAN_FOUND_SYSTEM_LIBS CACHE)
    foreach(_LIBRARY_NAME ${libraries})
        find_library(CONAN_FOUND_LIBRARY NAMES ${_LIBRARY_NAME} PATHS ${package_libdir}
                     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
        if(CONAN_FOUND_LIBRARY)
            conan_message(STATUS "Library ${_LIBRARY_NAME} found ${CONAN_FOUND_LIBRARY}")
            set(_LIB_NAME CONAN_LIB::${package_name}_${_LIBRARY_NAME}${build_type})
            add_library(${_LIB_NAME} UNKNOWN IMPORTED)
            set_target_properties(${_LIB_NAME} PROPERTIES IMPORTED_LOCATION ${CONAN_FOUND_LIBRARY})
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIB_NAME})
            set(_CONAN_ACTUAL_TARGETS ${_CONAN_ACTUAL_TARGETS} ${_LIB_NAME})
        else()
            conan_message(STATUS "Library ${_LIBRARY_NAME} not found in package, might be system one")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIBRARY_NAME})
            set(_CONAN_FOUND_SYSTEM_LIBS "${_CONAN_FOUND_SYSTEM_LIBS};${_LIBRARY_NAME}")
        endif()
        unset(CONAN_FOUND_LIBRARY CACHE)
    endforeach()

    # Add all dependencies to all targets
    string(REPLACE " " ";" deps_list "${deps}")
    foreach(_CONAN_ACTUAL_TARGET ${_CONAN_ACTUAL_TARGETS})
        set_property(TARGET ${_CONAN_ACTUAL_TARGET} PROPERTY INTERFACE_LINK_LIBRARIES "${_CONAN_FOUND_SYSTEM_LIBS};${deps_list}")
    endforeach()

    set(${libraries_abs_path} ${CONAN_FULLPATH_LIBS} PARENT_SCOPE)
endfunction()


macro(conan_set_libcxx)
    if(DEFINED CONAN_LIBCXX)
        conan_message(STATUS "Conan: C++ stdlib: ${CONAN_LIBCXX}")
        if(CONAN_COMPILER STREQUAL "clang" OR CONAN_COMPILER STREQUAL "apple-clang")
            if(CONAN_LIBCXX STREQUAL "libstdc++" OR CONAN_LIBCXX STREQUAL "libstdc++11" )
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libstdc++")
            elseif(CONAN_LIBCXX STREQUAL "libc++")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libc++")
            endif()
        endif()
        if(CONAN_COMPILER STREQUAL "sun-cc")
            if(CONAN_LIBCXX STREQUAL "libCstd")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=Cstd")
            elseif(CONAN_LIBCXX STREQUAL "libstdcxx")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stdcxx4")
            elseif(CONAN_LIBCXX STREQUAL "libstlport")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stlport4")
            elseif(CONAN_LIBCXX STREQUAL "libstdc++")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stdcpp")
            endif()
        endif()
        if(CONAN_LIBCXX STREQUAL "libstdc++11")
            add_definitions(-D_GLIBCXX_USE_CXX11_ABI=1)
        elseif(CONAN_LIBCXX STREQUAL "libstdc++")
            add_definitions(-D_GLIBCXX_USE_CXX11_ABI=0)
        endif()
    endif()
endmacro()


macro(conan_set_std)
    conan_message(STATUS "Conan: Adjusting language standard")
    # Do not warn "Manually-specified variables were not used by the project"
    set(ignorevar "${CONAN_STD_CXX_FLAG}${CONAN_CMAKE_CXX_STANDARD}${CONAN_CMAKE_CXX_EXTENSIONS}")
    if (CMAKE_VERSION VERSION_LESS "3.1" OR
        (CMAKE_VERSION VERSION_LESS "3.12" AND ("${CONAN_CMAKE_CXX_STANDARD}" STREQUAL "20" OR "${CONAN_CMAKE_CXX_STANDARD}" STREQUAL "gnu20")))
        if(CONAN_STD_CXX_FLAG)
            conan_message(STATUS "Conan setting CXX_FLAGS flags: ${CONAN_STD_CXX_FLAG}")
            set(CMAKE_CXX_FLAGS "${CONAN_STD_CXX_FLAG} ${CMAKE_CXX_FLAGS}")
        endif()
    else()
        if(CONAN_CMAKE_CXX_STANDARD)
            conan_message(STATUS "Conan setting CPP STANDARD: ${CONAN_CMAKE_CXX_STANDARD} WITH EXTENSIONS ${CONAN_CMAKE_CXX_EXTENSIONS}")
            set(CMAKE_CXX_STANDARD ${CONAN_CMAKE_CXX_STANDARD})
            set(CMAKE_CXX_EXTENSIONS ${CONAN_CMAKE_CXX_EXTENSIONS})
        endif()
    endif()
endmacro()


macro(conan_set_rpath)
    conan_message(STATUS "Conan: Adjusting default RPATHs Conan policies")
    if(APPLE)
        # https://cmake.org/Wiki/CMake_RPATH_handling
        # CONAN GUIDE: All generated libraries should have the id and dependencies to other
        # dylibs without path, just the name, EX:
        # libMyLib1.dylib:
        #     libMyLib1.dylib (compatibility version 0.0.0, current version 0.0.0)
        #     libMyLib0.dylib (compatibility version 0.0.0, current version 0.0.0)
        #     /usr/lib/libc++.1.dylib (compatibility version 1.0.0, current version 120.0.0)
        #     /usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1197.1.1)
        # AVOID RPATH FOR *.dylib, ALL LIBS BETWEEN THEM AND THE EXE
        # SHOULD BE ON THE LINKER RESOLVER PATH (./ IS ONE OF THEM)
        set(CMAKE_SKIP_RPATH 1 CACHE BOOL "rpaths" FORCE)
        # Policy CMP0068
        # We want the old behavior, in CMake >= 3.9 CMAKE_SKIP_RPATH won't affect the install_name in OSX
        set(CMAKE_INSTALL_NAME_DIR "")
    endif()
endmacro()


macro(conan_set_fpic)
    if(DEFINED CONAN_CMAKE_POSITION_INDEPENDENT_CODE)
        conan_message(STATUS "Conan: Adjusting fPIC flag (${CONAN_CMAKE_POSITION_INDEPENDENT_CODE})")
        set(CMAKE_POSITION_INDEPENDENT_CODE ${CONAN_CMAKE_POSITION_INDEPENDENT_CODE})
    endif()
endmacro()


macro(conan_output_dirs_setup)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})

    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})

    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
endmacro()


macro(conan_split_version VERSION_STRING MAJOR MINOR)
    #make a list from the version string
    string(REPLACE "." ";" VERSION_LIST "${VERSION_STRING}")

    #write output values
    list(LENGTH VERSION_LIST _version_len)
    list(GET VERSION_LIST 0 ${MAJOR})
    if(${_version_len} GREATER 1)
        list(GET VERSION_LIST 1 ${MINOR})
    endif()
endmacro()


macro(conan_error_compiler_version)
    message(FATAL_ERROR "Detected a mismatch for the compiler version between your conan profile settings and CMake: \n"
                        "Compiler version specified in your conan profile: ${CONAN_COMPILER_VERSION}\n"
                        "Compiler version detected in CMake: ${VERSION_MAJOR}.${VERSION_MINOR}\n"
                        "Please check your conan profile settings (conan profile show [default|your_profile_name])\n"
                        "P.S. You may set CONAN_DISABLE_CHECK_COMPILER CMake variable in order to disable this check."
           )
endmacro()

set(_CONAN_CURRENT_DIR ${CMAKE_CURRENT_LIST_DIR})

function(conan_get_compiler CONAN_INFO_COMPILER CONAN_INFO_COMPILER_VERSION)
    conan_message(STATUS "Current conanbuildinfo.cmake directory: " ${_CONAN_CURRENT_DIR})
    if(NOT EXISTS ${_CONAN_CURRENT_DIR}/conaninfo.txt)
        conan_message(STATUS "WARN: conaninfo.txt not found")
        return()
    endif()

    file (READ "${_CONAN_CURRENT_DIR}/conaninfo.txt" CONANINFO)

    # MATCHALL will match all, including the last one, which is the full_settings one
    string(REGEX MATCH "full_settings.*" _FULL_SETTINGS_MATCHED ${CONANINFO})
    string(REGEX MATCH "compiler=([-A-Za-z0-9_ ]+)" _MATCHED ${_FULL_SETTINGS_MATCHED})
    if(DEFINED CMAKE_MATCH_1)
        string(STRIP "${CMAKE_MATCH_1}" _CONAN_INFO_COMPILER)
        set(${CONAN_INFO_COMPILER} ${_CONAN_INFO_COMPILER} PARENT_SCOPE)
    endif()

    string(REGEX MATCH "compiler.version=([-A-Za-z0-9_.]+)" _MATCHED ${_FULL_SETTINGS_MATCHED})
    if(DEFINED CMAKE_MATCH_1)
        string(STRIP "${CMAKE_MATCH_1}" _CONAN_INFO_COMPILER_VERSION)
        set(${CONAN_INFO_COMPILER_VERSION} ${_CONAN_INFO_COMPILER_VERSION} PARENT_SCOPE)
    endif()
endfunction()


function(check_compiler_version)
    conan_split_version(${CMAKE_CXX_COMPILER_VERSION} VERSION_MAJOR VERSION_MINOR)
    if(DEFINED CONAN_SETTINGS_COMPILER_TOOLSET)
       conan_message(STATUS "Conan: Skipping compiler check: Declared 'compiler.toolset'")
       return()
    endif()
    if(CMAKE_CXX_COMPILER_ID MATCHES MSVC)
        # MSVC_VERSION is defined since 2.8.2 at least
        # https://cmake.org/cmake/help/v2.8.2/cmake.html#variable:MSVC_VERSION
        # https://cmake.org/cmake/help/v3.14/variable/MSVC_VERSION.html
        if(
            # 1930 = VS 17.0 (v143 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "17" AND NOT((MSVC_VERSION EQUAL 1930) OR (MSVC_VERSION GREATER 1930))) OR
            # 1920-1929 = VS 16.0 (v142 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "16" AND NOT((MSVC_VERSION GREATER 1919) AND (MSVC_VERSION LESS 1930))) OR
            # 1910-1919 = VS 15.0 (v141 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "15" AND NOT((MSVC_VERSION GREATER 1909) AND (MSVC_VERSION LESS 1920))) OR
            # 1900      = VS 14.0 (v140 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "14" AND NOT(MSVC_VERSION EQUAL 1900)) OR
            # 1800      = VS 12.0 (v120 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "12" AND NOT VERSION_MAJOR STREQUAL "18") OR
            # 1700      = VS 11.0 (v110 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "11" AND NOT VERSION_MAJOR STREQUAL "17") OR
            # 1600      = VS 10.0 (v100 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "10" AND NOT VERSION_MAJOR STREQUAL "16") OR
            # 1500      = VS  9.0 (v90 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "9" AND NOT VERSION_MAJOR STREQUAL "15") OR
            # 1400      = VS  8.0 (v80 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "8" AND NOT VERSION_MAJOR STREQUAL "14") OR
            # 1310      = VS  7.1, 1300      = VS  7.0
            (CONAN_COMPILER_VERSION STREQUAL "7" AND NOT VERSION_MAJOR STREQUAL "13") OR
            # 1200      = VS  6.0
            (CONAN_COMPILER_VERSION STREQUAL "6" AND NOT VERSION_MAJOR STREQUAL "12") )
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "gcc")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        set(_CHECK_VERSION ${VERSION_MAJOR}.${VERSION_MINOR})
        set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 5.0)
            conan_message(STATUS "Conan: Compiler GCC>=5, checking major version ${CONAN_COMPILER_VERSION}")
            conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
            if("${CONAN_COMPILER_MINOR}" STREQUAL "")
                set(_CHECK_VERSION ${VERSION_MAJOR})
                set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR})
            endif()
        endif()
        conan_message(STATUS "Conan: Checking correct version: ${_CHECK_VERSION}")
        if(NOT ${_CHECK_VERSION} VERSION_EQUAL ${_CONAN_VERSION})
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "clang")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        set(_CHECK_VERSION ${VERSION_MAJOR}.${VERSION_MINOR})
        set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 8.0)
            conan_message(STATUS "Conan: Compiler Clang>=8, checking major version ${CONAN_COMPILER_VERSION}")
            if("${CONAN_COMPILER_MINOR}" STREQUAL "")
                set(_CHECK_VERSION ${VERSION_MAJOR})
                set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR})
            endif()
        endif()
        conan_message(STATUS "Conan: Checking correct version: ${_CHECK_VERSION}")
        if(NOT ${_CHECK_VERSION} VERSION_EQUAL ${_CONAN_VERSION})
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "apple-clang" OR CONAN_COMPILER STREQUAL "sun-cc" OR CONAN_COMPILER STREQUAL "mcst-lcc")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        if(${CONAN_COMPILER_MAJOR} VERSION_GREATER_EQUAL "13" AND "${CONAN_COMPILER_MINOR}" STREQUAL "" AND ${CONAN_COMPILER_MAJOR} VERSION_EQUAL ${VERSION_MAJOR})
           # This is correct,  13.X is considered 13
        elseif(NOT ${VERSION_MAJOR}.${VERSION_MINOR} VERSION_EQUAL ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
           conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "intel")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 19.1)
            if(NOT ${VERSION_MAJOR}.${VERSION_MINOR} VERSION_EQUAL ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
               conan_error_compiler_version()
            endif()
        else()
            if(NOT ${VERSION_MAJOR} VERSION_EQUAL ${CONAN_COMPILER_MAJOR})
               conan_error_compiler_version()
            endif()
        endif()
    else()
        conan_message(STATUS "WARN: Unknown compiler '${CONAN_COMPILER}', skipping the version check...")
    endif()
endfunction()


function(conan_check_compiler)
    if(CONAN_DISABLE_CHECK_COMPILER)
        conan_message(STATUS "WARN: Disabled conan compiler checks")
        return()
    endif()
    if(NOT DEFINED CMAKE_CXX_COMPILER_ID)
        if(DEFINED CMAKE_C_COMPILER_ID)
            conan_message(STATUS "This project seems to be plain C, using '${CMAKE_C_COMPILER_ID}' compiler")
            set(CMAKE_CXX_COMPILER_ID ${CMAKE_C_COMPILER_ID})
            set(CMAKE_CXX_COMPILER_VERSION ${CMAKE_C_COMPILER_VERSION})
        else()
            message(FATAL_ERROR "This project seems to be plain C, but no compiler defined")
        endif()
    endif()
    if(NOT CMAKE_CXX_COMPILER_ID AND NOT CMAKE_C_COMPILER_ID)
        # This use case happens when compiler is not identified by CMake, but the compilers are there and work
        conan_message(STATUS "*** WARN: CMake was not able to identify a C or C++ compiler ***")
        conan_message(STATUS "*** WARN: Disabling compiler checks. Please make sure your settings match your environment ***")
        return()
    endif()
    if(NOT DEFINED CONAN_COMPILER)
        conan_get_compiler(CONAN_COMPILER CONAN_COMPILER_VERSION)
        if(NOT DEFINED CONAN_COMPILER)
            conan_message(STATUS "WARN: CONAN_COMPILER variable not set, please make sure yourself that "
                          "your compiler and version matches your declared settings")
            return()
        endif()
    endif()

    if(NOT CMAKE_HOST_SYSTEM_NAME STREQUAL ${CMAKE_SYSTEM_NAME})
        set(CROSS_BUILDING 1)
    endif()

    # If using VS, verify toolset
    if (CONAN_COMPILER STREQUAL "Visual Studio")
        if (CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "LLVM" OR
            CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "llvm" OR
            CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "clang" OR
            CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "Clang")
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "Clang")
        elseif (CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "Intel")
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "Intel")
        else()
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "MSVC")
        endif()

        if (NOT CMAKE_CXX_COMPILER_ID MATCHES ${EXPECTED_CMAKE_CXX_COMPILER_ID})
            message(FATAL_ERROR "Incorrect '${CONAN_COMPILER}'. Toolset specifies compiler as '${EXPECTED_CMAKE_CXX_COMPILER_ID}' "
                                "but CMake detected '${CMAKE_CXX_COMPILER_ID}'")
        endif()

    # Avoid checks when cross compiling, apple-clang crashes because its APPLE but not apple-clang
    # Actually CMake is detecting "clang" when you are using apple-clang, only if CMP0025 is set to NEW will detect apple-clang
    elseif((CONAN_COMPILER STREQUAL "gcc" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU") OR
        (CONAN_COMPILER STREQUAL "apple-clang" AND NOT CROSS_BUILDING AND (NOT APPLE OR NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang")) OR
        (CONAN_COMPILER STREQUAL "clang" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang") OR
        (CONAN_COMPILER STREQUAL "sun-cc" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "SunPro") )
        message(FATAL_ERROR "Incorrect '${CONAN_COMPILER}', is not the one detected by CMake: '${CMAKE_CXX_COMPILER_ID}'")
    endif()


    if(NOT DEFINED CONAN_COMPILER_VERSION)
        conan_message(STATUS "WARN: CONAN_COMPILER_VERSION variable not set, please make sure yourself "
                             "that your compiler version matches your declared settings")
        return()
    endif()
    check_compiler_version()
endfunction()


macro(conan_set_flags build_type)
    set(CMAKE_CXX_FLAGS${build_type} "${CMAKE_CXX_FLAGS${build_type}} ${CONAN_CXX_FLAGS${build_type}}")
    set(CMAKE_C_FLAGS${build_type} "${CMAKE_C_FLAGS${build_type}} ${CONAN_C_FLAGS${build_type}}")
    set(CMAKE_SHARED_LINKER_FLAGS${build_type} "${CMAKE_SHARED_LINKER_FLAGS${build_type}} ${CONAN_SHARED_LINKER_FLAGS${build_type}}")
    set(CMAKE_EXE_LINKER_FLAGS${build_type} "${CMAKE_EXE_LINKER_FLAGS${build_type}} ${CONAN_EXE_LINKER_FLAGS${build_type}}")
endmacro()


macro(conan_global_flags)
    if(CONAN_SYSTEM_INCLUDES)
        include_directories(SYSTEM ${CONAN_INCLUDE_DIRS}
                                   "$<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_RELEASE}>"
                                   "$<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_RELWITHDEBINFO}>"
                                   "$<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_MINSIZEREL}>"
                                   "$<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_DEBUG}>")
    else()
        include_directories(${CONAN_INCLUDE_DIRS}
                            "$<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_RELEASE}>"
                            "$<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_RELWITHDEBINFO}>"
                            "$<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_MINSIZEREL}>"
                            "$<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_DEBUG}>")
    endif()

    link_directories(${CONAN_LIB_DIRS})

    conan_find_libraries_abs_path("${CONAN_LIBS_DEBUG}" "${CONAN_LIB_DIRS_DEBUG}"
                                  CONAN_LIBS_DEBUG)
    conan_find_libraries_abs_path("${CONAN_LIBS_RELEASE}" "${CONAN_LIB_DIRS_RELEASE}"
                                  CONAN_LIBS_RELEASE)
    conan_find_libraries_abs_path("${CONAN_LIBS_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_RELWITHDEBINFO}"
                                  CONAN_LIBS_RELWITHDEBINFO)
    conan_find_libraries_abs_path("${CONAN_LIBS_MINSIZEREL}" "${CONAN_LIB_DIRS_MINSIZEREL}"
                                  CONAN_LIBS_MINSIZEREL)

    add_compile_options(${CONAN_DEFINES}
                        "$<$<CONFIG:Debug>:${CONAN_DEFINES_DEBUG}>"
                        "$<$<CONFIG:Release>:${CONAN_DEFINES_RELEASE}>"
                        "$<$<CONFIG:RelWithDebInfo>:${CONAN_DEFINES_RELWITHDEBINFO}>"
                        "$<$<CONFIG:MinSizeRel>:${CONAN_DEFINES_MINSIZEREL}>")

    conan_set_flags("")
    conan_set_flags("_RELEASE")
    conan_set_flags("_DEBUG")

endmacro()


macro(conan_target_link_libraries target)
    if(CONAN_TARGETS)
        target_link_libraries(${target} ${CONAN_TARGETS})
    else()
        target_link_libraries(${target} ${CONAN_LIBS})
        foreach(_LIB ${CONAN_LIBS_RELEASE})
            target_link_libraries(${target} optimized ${_LIB})
        endforeach()
        foreach(_LIB ${CONAN_LIBS_DEBUG})
            target_link_libraries(${target} debug ${_LIB})
        endforeach()
    endif()
endmacro()


macro(conan_include_build_modules)
    if(CMAKE_BUILD_TYPE)
        if(${CMAKE_BUILD_TYPE} MATCHES "Debug")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_DEBUG} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "Release")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_RELEASE} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "RelWithDebInfo")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_RELWITHDEBINFO} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "MinSizeRel")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_MINSIZEREL} ${CONAN_BUILD_MODULES_PATHS})
        endif()
    endif()

    foreach(_BUILD_MODULE_PATH ${CONAN_BUILD_MODULES_PATHS})
        include(${_BUILD_MODULE_PATH})
    endforeach()
endmacro()


### Definition of user declared vars (user_info) ###

