if(_NDS_CMAKE_INCLUDED)
    return()
endif()
set(_NDS_CMAKE_INCLUDED TRUE)

if(NOT DEFINED DEVKITPRO)
    message(FATAL_ERROR "DEVKITPRO is not set. Did you set CMAKE_TOOLCHAIN_FILE to cmake/Toolchain.cmake?")
endif()

function(make_nds TARGET)
    cmake_parse_arguments(NDS
        ""
        "C_STANDARD"
        "SOURCES;INCLUDES;LIBS"
        ${ARGN}
    )

    if(NOT NDS_SOURCES)
        message(FATAL_ERROR "make_nds(${TARGET}): SOURCES is required")
    endif()

    if(NOT NDS_C_STANDARD)
        set(NDS_C_STANDARD 11)
    endif()

    add_executable(${TARGET} ${NDS_SOURCES})

    target_include_directories(${TARGET} PRIVATE
        "${DEVKITPRO}/libnds/include"
        ${NDS_INCLUDES}
    )

    target_link_libraries(${TARGET} PRIVATE
        nds9
        ${NDS_LIBS}
    )

    target_compile_features(${TARGET} PRIVATE c_std_${NDS_C_STANDARD})

    nds_create_rom(${TARGET})
endfunction()