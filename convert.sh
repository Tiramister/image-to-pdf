#!/usr/bin/env bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 <dir>"
  exit 1
fi

dir=$1

for imgdir in "$dir"/*/; do
  dirname=$(basename "$imgdir")
  echo "$dirname"

  convert "$imgdir"*.{png,jpeg,jpg} tmp.pdf
  gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dPDFSETTINGS=/prepress -sOutputFile="$dir/$dirname.pdf" tmp.pdf
  rm tmp.pdf
done

