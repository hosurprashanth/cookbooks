#beging of the script


if [ $# -ne 2 ]
then

	echo "Invalid Syntax ,Usage: bash $0 <employee.csv>  <dept.csv> "

	exit 0

fi

emp_rec_count=`cat $1 |wc -l`

i=1

while [ $i -le $emp_rec_count ]
do
	

	emp_record=`awk 'NR=='$i' {print}' < $1`
	
	
		
	dept_rec_count=`cat $2 |wc -l`

	emp_deptno=`echo $emp_record |cut -d":" -f4`

		j=1

		while [ $j -le $dept_rec_count ]
		do
			
			dept_record=`awk 'NR=='$j' {print}' < $2`
			

			dept_deptno=`echo $dept_record | cut -d":" -f1`

			if [ $emp_deptno -eq $dept_deptno ]
			then

				emp_part1=`echo $emp_record |cut -d":" -f1,2,3`
				dept_part=`echo $dept_record |cut -d":" -f2,3`
				emp_part2=`echo $emp_record |cut -d":" -f5,6,7`

				final_record=$emp_part1:$dept_part:$emp_part2

				echo $final_record
			fi

			j=`expr $j + 1 `

		done		
	

	i=`expr $i + 1 `
done

#end of the script 

