#!/bin/bash
gfortran -o gfmaxwell.exe  -ffixed-line-length-132 -O3 -fno-automatic maxwell.f

#gfortran -o gfmaxwellDeb.exe -fno-automatic -fno-range-check -ffree-line-length-none -ffixed-line-length-132 -g maxwell.f
