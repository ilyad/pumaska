#!/bin/sh

doit()
{
  export DPI=300
  sam2p -m:dpi:$(echo "scale = 2; 72*72/$DPI" | bc) scan/$1.png EPS: $1.eps
}

doit russia-2011-back
doit russia-2011-front
