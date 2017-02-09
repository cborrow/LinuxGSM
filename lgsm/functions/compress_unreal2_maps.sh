#!/bin/bash
# LGSM compress_unreal2_maps.sh function
# Author: Daniel Gibbs
# Website: https://gameservermanagers.com
# Description: Compresses unreal maps.

local commandaction="Unreal Map Compressor"
local function_selfname="$(basename $(readlink -f "${BASH_SOURCE[0]}"))"

check.sh
clear
echo "${gamename} Map Compressor"
echo "================================="
echo "Will compress all maps in:"
echo ""
pwd
echo ""
echo "Compressed maps saved to:"
echo ""
echo "${compressedmapsdir}"
echo ""
if ! fn_prompt_yn "Start compression?" Y; then
	echo Exiting; return
fi
mkdir -pv "${compressedmapsdir}" > /dev/null 2>&1
rm -rfv "${filesdir}/Maps/"*.ut2.uz2
cd "${systemdir}"
for map in "${filesdir}/Maps/"*; do
	./ucc-bin compress "${map}" --nohomedir
done
mv -fv "${filesdir}/Maps/"*.ut2.uz2 "${compressedmapsdir}"
core_exit.sh
