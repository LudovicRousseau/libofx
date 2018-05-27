#!/bin/sh

source /appveyor.environment
export MSYSTEM

if test "$MSYSTEM"x == "MINGW64"x; then
	i_pkg_postfix="w64-x86_64"
else
	i_pkg_postfix="w64-i686"
fi

pacman -S --noconfirm patch
