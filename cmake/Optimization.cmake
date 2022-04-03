function(enable_optimization target OPTIMIZATION_LEVEL)
  if("${OPTIMIZATION_LEVEL}" GREATER "3"
      OR
      "${OPTIMIZATION_LEVEL}" LESS "0")

    message(FATAL_ERROR "Optimzation level must be between 0 and 3")
  endif()

	set(OPTIMIZATION_FLAG $<IF:$<CXX_COMPILER_ID:MSVC>,/W,-O>)
  string(APPEND OPTIMIZATION_FLAG ${OPTIMIZATION_LEVEL})

  target_compile_options(${target} PRIVATE $<$<NOT:$<CONFIG:Debug>>:${OPTIMIZATION_FLAG}>)
endfunction()
