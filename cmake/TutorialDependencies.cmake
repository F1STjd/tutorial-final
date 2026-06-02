# Dependencies aligned with Khronos Vulkan-Tutorial (SFML instead of GLFW).
# https://github.com/KhronosGroup/Vulkan-Tutorial

find_package(glm CONFIG REQUIRED)

find_package(PkgConfig REQUIRED)
pkg_check_modules(stb REQUIRED IMPORTED_TARGET stb)

find_program(
  SLANGC_EXECUTABLE
  NAMES slangc
  HINTS
    "$ENV{VULKAN_SDK}/bin"
    "D:/tools/slang/bin"
    "$ENV{USERPROFILE}/scoop/apps/slang/current/bin"
    "$ENV{USERPROFILE}/scoop/shims"
  DOC "Slang shader compiler (scoop: slang, or Vulkan SDK)")

if(NOT SLANGC_EXECUTABLE)
  message(FATAL_ERROR
    "slangc not found. Install with: scoop install slang\n"
    "Or unpack from https://github.com/shader-slang/slang/releases")
endif()

find_program(
  GLSLANG_VALIDATOR_EXECUTABLE
  NAMES glslangValidator
  HINTS "$ENV{VULKAN_SDK}/bin"
  DOC "glslangValidator (MSYS2: mingw-w64-x86_64-glslang)")

if(NOT GLSLANG_VALIDATOR_EXECUTABLE)
  message(WARNING
    "glslangValidator not found; GLSL fallback shaders will not compile. "
    "Install MSYS2 package mingw-w64-x86_64-glslang.")
endif()

add_library(Tutorial::stb ALIAS PkgConfig::stb)

add_executable(Slang::slangc IMPORTED GLOBAL)
set_target_properties(Slang::slangc PROPERTIES
  IMPORTED_LOCATION "${SLANGC_EXECUTABLE}")

if(GLSLANG_VALIDATOR_EXECUTABLE)
  add_executable(glslang::validator IMPORTED GLOBAL)
  set_target_properties(glslang::validator PROPERTIES
    IMPORTED_LOCATION "${GLSLANG_VALIDATOR_EXECUTABLE}")
endif()
