# SPDX-License-Identifier: MIT
#
# Copyright (c) 2020-2022 Antonio Niño Díaz

ugba_toolchain_sdl2()

include(compiler_flags.cmake)

# Define ltarget
# --------------

set(GAME_NAME ugba-template)

add_executable(${GAME_NAME})

compiler_flags_sdl2(${GAME_NAME})
linker_flags_sdl2(${GAME_NAME})

target_link_libraries(${GAME_NAME} libugba)
target_link_libraries(${GAME_NAME} umod_player)

# Source code, include directories and global definitions
# -------------------------------------------------------

target_sources(${GAME_NAME} PRIVATE ${ALL_FILES_SOURCE})
target_include_directories(${GAME_NAME} PRIVATE ${INCLUDE_PATHS})

install(
    TARGETS
        ${GAME_NAME} libugba
    DESTINATION
        .
)
