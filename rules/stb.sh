#!/bin/sh

cd "$1" || return

headers=$(ls -1 *.h)

for header in $headers; do
	echo "#include \"stb.h\"
#include \"$header\"" \
		>"$2"/"${header%%.h}".c
done
