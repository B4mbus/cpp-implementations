# Taken from https://github.com/cpp-best-practices/project-options,
# modified almost everything

function(enable_flto target)
  include(CheckIPOSupported)
  check_ipo_supported(RESULT ipo_supported OUTPUT output)

  if(NOT ipo_supported)
    message(SEND_ERROR "IPO not supported! ${output}")
  else()
		set_target_properties(
			${target} 
			PROPERTIES
			INTERPROCEDURAL_OPTIMIZATION_RELEASE YES
			INTERPROCEDURAL_OPTIMIZATION_RELWITHDEBINFO YES
		)
  endif()
endfunction()
