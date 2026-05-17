if(NOT DEFINED ENV{DEVKITPRO} OR NOT DEFINED ENV{DEVKITARM})
    message(FATAL_ERROR "devkitPro environment is not set up. Please install devkitPro with NDS environment.")
endif()

file(TO_CMAKE_PATH "$ENV{DEVKITPRO}" DEVKITPRO)
set(DEVKITPRO "${DEVKITPRO}" CACHE PATH "devkitPro root")
set(DEVKITARM "${DEVKITARM}" CACHE PATH "devkitARM root")

include("${DEVKITPRO}/cmake/NDS.cmake")