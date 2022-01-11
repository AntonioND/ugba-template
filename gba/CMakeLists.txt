# SPDX-License-Identifier: MIT
#
# Copyright (c) 2021-2022 Antonio Niño Díaz

toolchain_gba()

# Define target
# -------------

set(GAME_NAME_GBA "${GAME_NAME}-gba")

add_executable(${GAME_NAME_GBA})
target_link_libraries(${GAME_NAME_GBA} libugba_gba)
if(NOT USE_DEVKITARM)
    target_link_libraries(${GAME_NAME_GBA} libsysgba_gba)
endif()
target_link_libraries(${GAME_NAME_GBA} umod_player_gba)

# Source code, include directories and global definitions
# -------------------------------------------------------

target_sources(${GAME_NAME_GBA} PRIVATE ${ALL_FILES_SOURCE})
target_include_directories(${GAME_NAME_GBA} PRIVATE ${INCLUDE_PATHS})

# Build options
# -------------

gba_set_compiler_options(${GAME_NAME_GBA})
if(NOT USE_DEVKITARM)
    libsysgba_set_compiler_options(${GAME_NAME_GBA})
endif()

set(ARGS_C -Wall -Wextra -Wno-unused-parameter)

target_compile_options(${GAME_NAME_GBA} PRIVATE
    $<$<COMPILE_LANGUAGE:C>:${ARGS_C}>
)

target_link_options(${GAME_NAME_GBA} PRIVATE
    -flto
    -Wno-stringop-overflow -Wno-stringop-overread
)

# Generate GBA ROM from the ELF file
# ----------------------------------

make_gba_rom(${GAME_NAME_GBA} ${GAME_NAME_GBA} "UGBA-TEMPLATE" "UGBA")

install(
    FILES
        ${CMAKE_CURRENT_BINARY_DIR}/${GAME_NAME_GBA}.gba
    DESTINATION
        .
)
