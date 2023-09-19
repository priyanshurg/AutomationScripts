for i in */;
	do
	str=${i%?}
#  sed -i.bak "s:run 5000000:run 30000000:" $i/AmtB-SMD01.conf  
  sed -i.bak "s:coordinates        m01p01.pdb:coordinates        $str.pdb:" $i/AmtB-SMD01.conf  

done
