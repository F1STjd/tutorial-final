add_library(utils INTERFACE)
target_compile_features(utils INTERFACE cxx_std_26)
target_link_libraries(utils INTERFACE glm::glm Tutorial::stb)
