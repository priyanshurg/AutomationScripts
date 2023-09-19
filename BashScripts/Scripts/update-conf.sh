for i in m01p01 m0103 m0305 m0507 m0709 m0911 m1113 m1315 m1517 m1719 m1921 m2123 m2325 m2527 m2729 p0103 p0305 p0507 p0709 p0911 p1113 p1315 p1517 p1719 p1921 p2123 p2325 p2527 p2729;
	do
	cp BaseFiles/Step5-Input.conf $i/
	mv $i/$i.pdb $i/$i-Step5-Input.pdb
	str=${i%?}
	k="-Step5-Input"
	str2=$i$k
#  sed -i.bak "s:run 5000000:run 30000000:" $i/AmtB-SMD01.conf  
  sed -i.bak "s:coordinates        m0103.pdb:coordinates        $str2.pdb:" $i/Step5-Input.conf  

done
