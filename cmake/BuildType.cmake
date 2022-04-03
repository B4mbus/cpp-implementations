function(set_default_build_type)

	# Straight-up yoinked from https://github.com/cpp-best-practices/cpp_starter_project

  get_property(BUILDING_MULTI_CONFIG GLOBAL PROPERTY GENERATOR_IS_MULTI_CONFIG)

  if(BUILDING_MULTI_CONFIG)
    if(NOT CMAKE_BUILD_TYPE)
      message(TRACE "Setting up multi-config build types")
      set(CMAKE_CONFIGURATION_TYPES
          Debug
          Release
          RelWithDebInfo
          MinSizeRel
          CACHE STRING "Enabled build types" FORCE)
    else()
      set(CMAKE_CONFIGURATION_TYPES ${CMAKE_BUILD_TYPE} CACHE STRING "Enabled build types" FORCE)
    endif()
  endif()


endfunction()
