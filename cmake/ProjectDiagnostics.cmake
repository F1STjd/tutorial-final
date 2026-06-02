include(CheckCXXCompilerFlag)

# GCC/Clang diagnostic output (probed; unsupported flags are skipped per compiler).
set(_diag_candidates
  -fdiagnostics-color
  -fcolor-diagnostics
  -fdiagnostics-urls=always
  -fdiagnostics-parseable-fixits
  -fdiagnostics-generate-patch
  -fdiagnostics-show-highlight-colors
  -fdiagnostics-show-event-links
  -fdiagnostics-show-labels
  -fdiagnostics-show-option
  -fdiagnostics-show-context=1
  -fdiagnostics-minimum-margin-width=4)

foreach(_flag IN LISTS _diag_candidates)
  string(MAKE_C_IDENTIFIER "${_flag}" _id)
  check_cxx_compiler_flag("${_flag}" HAS_${_id})
  if(HAS_${_id})
    add_compile_options("${_flag}")
  endif()
endforeach()
