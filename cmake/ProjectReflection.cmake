include(CheckCXXCompilerFlag)

option(ENABLE_CXX26_REFLECTION "Enable C++26 reflection (-freflection, GCC 16+)" ON)

if(ENABLE_CXX26_REFLECTION)
  check_cxx_compiler_flag("-freflection" HAS_freflection)
  if(HAS_freflection)
    # Global: required so CMake's import-std target (std.cc) also sees -freflection
    # and libstdc++ exports <meta> through the std module.
    add_compile_options(-freflection)
  else()
    message(STATUS
      "C++26 reflection requested but -freflection is not supported by "
      "${CMAKE_CXX_COMPILER_ID} ${CMAKE_CXX_COMPILER_VERSION}")
  endif()
endif()
