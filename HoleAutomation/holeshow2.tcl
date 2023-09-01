proc loadh {j} {
set k [expr $j+10]
for {set i $j} {$i<$k} {incr i} {
mol new prot.pdb
mol delrep 0 top
cd Outputs/
source dotsurface$i.vmd_plot
mol rename top run$i
cd ..
}
}

proc hideh {j} {set k [expr $j+10];for {set i $j} {$i<$k} {incr i} {mol off $i}}

proc showh {j} {set k [expr $j+10];for {set i $j} {$i<$k} {incr i} {mol on $i}}

proc showhj {j} {mol on $j}
proc hidehj {j} {mol off $j}

proc hideall {} {for {set i 2} {$i<100} {incr i} {mol off $i}}
proc showall {} {for {set i 2} {$i<100} {incr i} {mol on $i}}
