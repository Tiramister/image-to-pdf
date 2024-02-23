#!/usr/bin/env bash

if [ $# -ne 1 ]; then
	echo "Usage: $0 <dir>"
	exit 1
fi

# glob で no such file or directory が出ないようにする
shopt -s nullglob

dir=$1
tmpdir="$dir/tmp"

for imgdir in "$dir"/*/; do
	mkdir -p "$tmpdir"

	dirname=$(basename "$imgdir")
	echo "convert directory: $dirname" >&2

	# 同じサイズ・解像度の jpg に変換
	for img in "$imgdir"*.{png,jpeg,jpg}; do
		filename=$(basename "$img")
		imgname=${filename%.*}

		echo $imgname >&2
		convert -resize 800x -units PixelsPerInch -density 96 "$img" "$tmpdir/$imgname.jpg"
	done

	convert "$tmpdir"/*.jpg "$dir/$dirname.pdf"

	rm -r "$tmpdir"
done
