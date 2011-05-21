#!/bin/bash

function doit
{
  export DPI=300
  sam2p -m:dpi:$(python -c "print (72.0**2)/$DPI") scan/$1.png EPS: $1.eps 
}

doit russia-2011-back
doit russia-2011-front

