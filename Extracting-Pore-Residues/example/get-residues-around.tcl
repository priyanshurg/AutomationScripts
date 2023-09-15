#Get-residues-around.tcl

# proc get_residues { atomsel dist } {

set normal {0.5234239225902136 0.1570271767770641 0.8374782761443419}
set v1 {74.27298944547701 20.181896833643126 74.6367831127633}
set v2 {41.29728232229359 10.289184696688077 21.875651715669743}

set globalenvResName {}
set globalenvRes_full_id {}
set globalenvRes_id {}
set globalenvRes_resid {}
set dist 5

set sod [atomselect top "resname SOD"]
$sod moveto $v1
set atomsel [atomselect top "resname SOD"]


for {set i 0 } { $i < 100 } {incr i 1 } {
    set pnew [vecsub $v1 [vecscale $normal $i]]
    $sod moveto $pnew
    set pshift [veclength [vecscale $normal $i]]
    puts "$i $pshift"
    draw color green
    draw sphere $pnew radius 0.5
    set am [atomselect top "resname SOD"]
    set amName [$am get name]
    set env2 [atomselect top "(within $dist of resname SOD) and (not name $amName)"]


    set envResID [$env2 get resid]
    set envChains [$env2 get chain]
    set envList {}

    foreach resid $envResID chain $envChains {
        lappend envList [list $resid $chain]
    }

    set envList [lsort -unique $envList]

    #Extracing Resname-Resid combinations
    set envResName {}
    set envRes_full_id {}
    set envRes_id {}
    set envRes_resid {}


     foreach residueinfo $envList {
         set l1 [llength $envResName]
         set l2 [llength $envRes_full_id]
         set l3 [llength $envRes_id]
         set l4 [llength $globalenvResName]
         set l5 [llength $globalenvRes_full_id]
         set l6 [llength $globalenvRes_id]
         puts "$l1 $l2 $l3 $l4 $l5 $l6"

          set chain [lindex $residueinfo 1]
          set resid [lindex $residueinfo 0]
          set res [atomselect top "chain $chain and resid $resid and name CA"]
           lappend envResName [list [$res get resname]]
           lappend envRes_full_id [list [$res get resname] [$res get resid] [$res get chain]]
           lappend envRes_id [list [$res get resname] [$res get resid] ]
           lappend envRes_resid [list [$res get resid]]
           lappend globalenvResName [list [$res get resname]]
           lappend globalenvRes_full_id [list [$res get resname] [$res get resid] [$res get chain]]
           lappend globalenvRes_id [list [$res get resname] [$res get resid] ]
           lappend globalenvRes_resid [list [$res get resid]]
     }



}
    
set globalenvResName [lsort -unique $globalenvResName] 
set globalenvRes_full_id [lsort -unique $globalenvRes_full_id ]
set globalenvRes_id [lsort -unique $globalenvRes_id] 
set globalenvRes_resid [lsort -unique $globalenvRes_resid] 

# puts "  "
puts "  $globalenvRes_id"






# }
