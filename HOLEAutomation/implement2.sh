#!/bin/bash

#qpt_conv

                                for i in {1..100}
                                do
                                hole < hole.inp > Outputs/hole_out$i.txt
                                egrep "mid-|sampled" Outputs/hole_out$i.txt > Outputs/hole_out$i.tsv
                                sph_process -dotden 15 -color hole_out.sph Outputs/dotsurface$i.qpt
                                cd Outputs/
                                qpt_conv
                                rm *.qpt
                                cd ..
                                done
                                
