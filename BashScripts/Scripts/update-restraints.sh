for i in */;
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
    sed -i.bak "s/lowerboundary   -1.00/lowerboundary   $first2.00/" $i/restrain.in
    sed -i.bak "s/upperboundary   01.00/upperboundary   $next2.00/" $i/restrain.in 
    sed -i.bak "s/lowerWall   -1.00/lowerWall   $first2.00/" $i/restrain.in
    sed -i.bak "s/upperWall   1.00/upperWall   $next2.00/" $i/restrain.in 
    sed -i.bak "s/distanceXY /distanceZ /" $i/restrain.in    
  elif [[ "$sign" == "m" ]]; then
    sed -i.bak "s/lowerboundary   -1.00/lowerboundary   -$next2.00/" $i/restrain.in
    sed -i.bak "s/upperboundary   01.00/upperboundary   -$first2.00/" $i/restrain.in 
    sed -i.bak "s/lowerWall   -1.00/lowerWall   -$next2.00/" $i/restrain.in
    sed -i.bak "s/upperWall   1.00/upperWall   -$first2.00/" $i/restrain.in
    sed -i.bak "s/distanceXY /distanceZ /" $i/restrain.in
    
  fi
done
