#!/bin/bash
#
# SPDX-License-Identifier: MIT
#
# Copyright (c) 2021, Antonio Niño Díaz

SCRIPT=`realpath $0`
IN=`dirname $SCRIPT`
OUT=$1

echo ""
echo "[*] Converting ${IN}..."
echo ""

${SUPERFAMICONV} palette \
    --mode gba \
    --palettes 1 \
    --colors 16 \
    --color-zero FF00FF \
    --in-image ${IN}/city.png \
    --out-data ${OUT}/city_palette.bin \
    --out-image ${OUT}/city_palette.png \
    --verbose

${SUPERFAMICONV} tiles \
    --mode gba \
    --bpp 4 \
    --tile-width 8 --tile-height 8 \
    --max-tiles 512 \
    --in-image ${IN}/city.png \
    --in-palette ${OUT}/city_palette.bin \
    --out-data ${OUT}/city_tiles.bin \
    --out-image ${OUT}/city_tiles.png \
    --no-flip \
    --verbose

${SUPERFAMICONV} map \
    --mode gba \
    --bpp 4 \
    --tile-width 8 --tile-height 8 \
    --tile-base-offset 0 \
    --palette-base-offset 0 \
    --map-width 64 --map-height 64 \
    --split-width 64 --split-height 64 \
    --in-image ${IN}/city.png \
    --in-palette ${OUT}/city_palette.bin \
    --in-tiles ${OUT}/city_tiles.bin \
    --out-data ${OUT}/city_map.bin \
    --no-flip \
    --verbose
