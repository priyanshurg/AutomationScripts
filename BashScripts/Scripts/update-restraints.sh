for i in m01p01 m0103 m0305 m0507 m0709 m0911 m1113 m1315 m1517 m1719 m1921 m2123 m2325 m2527 m2729 p0103 p0305 p0507 p0709 p0911 p1113 p1315 p1517 p1719 p1921 p2123 p2325 p2527 p2729;
	do
	str=$i
	sign=${i:0:1}
	str=${str:1}
	first2=${str:0:2}
	next2=${str:2:2}
	echo $i
	m="m"
	p="p"
  if [[ "$sign" == "p" ]]; then
    sed -i.bak "s/lowerboundary   -03.00/lowerboundary   $first2.00/" $i/restrain.in
    sed -i.bak "s/upperboundary   -01.00/upperboundary   $next2.00/" $i/restrain.in 
    sed -i.bak "s/lowerWall   -03.00/lowerWall   $first2.00/" $i/restrain.in
    sed -i.bak "s/upperWall   1.00/upperWall   $next2.00/" $i/restrain.in 
    # sed -i.bak "s/distanceXY /distanceZ /" $i/restrain.in    
  elif [[ "$sign" == "m" ]]; then
    sed -i.bak "s/lowerboundary   -03.00/lowerboundary   -$next2.00/" $i/restrain.in
    sed -i.bak "s/upperboundary   -01.00/upperboundary   -$first2.00/" $i/restrain.in 
    sed -i.bak "s/lowerWall   -03.00/lowerWall   -$next2.00/" $i/restrain.in
    sed -i.bak "s/upperWall   -01.00/upperWall   -$first2.00/" $i/restrain.in
    # sed -i.bak "s/distanceXY /distanceZ /" $i/restrain.in
    
  fi
  cat $i/restrain.in BaseFiles/concat-restrain.in > $i/restrain2.in
  mv $i/restrain2.in $i/restrain.in


done
