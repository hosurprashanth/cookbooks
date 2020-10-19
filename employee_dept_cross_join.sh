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

		j=1

		while [ $j -le $dept_rec_count ]
		do

			dept_record=`awk 'NR=='$j' {print}' < $2`

			echo "$emp_record ### $dept_record"

			j=`expr $j + 1 `

		done		
	

	i=`expr $i + 1 `
done

#end of the script 

