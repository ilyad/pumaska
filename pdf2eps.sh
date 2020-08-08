#!/bin/bash
# $Id: pdf2eps,v 0.01 2005/10/28 00:55:46 Herbert Voss Exp $
# From https://tex.stackexchange.com/questions/20883/how-to-convert-pdf-to-eps
# Convert PDF to encapsulated PostScript.
# usage:
# pdf2eps <page amount> <pdf file>

set -e

pages="$1"
pdf_file="$2"

cat "$pdf_file" > /dev/null

re='^[0-9][0-9]*$'
if ! [[ $pages =~ $re ]] ; then
    echo "$0: error: not a number" >&2
    exit 1
fi

echo "cropping $pdf_file"
pdfcrop "$pdf_file" "$pdf_file.crop.pdf"

for page in $(seq 1 $pages)
do
    echo "Processing page #$page of $pdf_file"
    pdftops -f $page -l $page -eps "$pdf_file.crop.pdf" "$pdf_file.page-$page.eps"
done

rm  "$pdf_file.crop.pdf"
