function(add_dependency target)
  cmake_parse_arguments(
    "DEP"
    ""
    "GITHUB;TAG"
		""
		${ARGN}
  )

	message("Trying to find ${target} with find_package.")

	find_package(${target} QUIET)

	if(NOT "${${target}_FOUND}")
    include(FetchContent)

		message("Downloading ${target} from ${DEP_GITHUB} :: TAG ${DEP_TAG}")

    FetchContent_Declare(
      ${target}
      GIT_REPOSITORY ${DEP_GITHUB}
      GIT_TAG ${DEP_TAG}
    )

		message("Populating now.")

		FetchContent_MakeAvailable(${target})

		message("${target} downloaded and built.")

	endif()
endfunction()
