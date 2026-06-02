add_executable(tutorial-final main.cpp)
target_compile_features(tutorial-final PRIVATE cxx_std_26)
set_target_properties(tutorial-final PROPERTIES
  CXX_MODULE_STD ON
  RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}")
target_link_libraries(tutorial-final PRIVATE lbn project_warnings)
target_link_libraries(tutorial-final PRIVATE
  $<$<PLATFORM_ID:Windows>:stdc++exp>)
