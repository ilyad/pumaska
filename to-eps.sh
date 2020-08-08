#!/bin/sh

doit_legacy()
{
  export DPI=300
  sam2p -m:dpi:$(echo "scale = 2; 72*72/$DPI" | bc) scan/$1.png EPS: $1.eps
}

doit()
{
  echo converting "$1"
  convert scan/$1.png eps3:$1.eps
}

doit russia-2011-back
doit russia-2011-front
doit arag-2018

./pdf2eps.sh 4 kela-sv178e-2019-04.pdf 2>errors
