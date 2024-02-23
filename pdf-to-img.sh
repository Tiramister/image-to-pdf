#!/usr/bin/env bash

if [ $# -ne 1 ]; then
	echo "Usage: $0 <dir>"
	exit 1
fi

# glob で no such file or directory が出ないようにする
shopt -s nullglob

dir=$1

for pdf_path in "$dir"/*.pdf; do
	pdf_file=$(basename "$pdf_path")
	pdf_name=${pdf_file%.*}
	echo "convert PDF: $pdf_name" >&2

	outdir="$dir/$pdf_name"

	mkdir -p "$outdir"
	convert -units PixelsPerInch -density 192 -quality 100 "$pdf_path" "$outdir/%03d.jpg"
done
