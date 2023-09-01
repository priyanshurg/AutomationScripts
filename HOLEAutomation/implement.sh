#!/bin/bash

hole < hole.inp > hole_out.txt
egrep "mid-|sampled" hole_out.txt > hole_out.tsv
sph_process -dotden 15 -color hole_out.sph dotsurface.qpt
qpt_conv
