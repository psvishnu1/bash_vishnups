<<comment

Write a Bash script to process student information. You are given a CSV file named data.csv with student roll number, marks obtained for two subjects (out of 100) all separated by commas. 
Write a shell script that does the following:

	1) Prints the number of student entries in the file.

	2) Then, for each student prints the student roll number, marks for the first and second subject and the average score for the first and second subject. A sample output should look like:

			Rollno 111501003 | Subject 1 29.25 | Subject 2 92.50 | Average 60.87

	3) Output a CSV file named result.txt where the first, second and third column is same as that in data.txt and the fourth column is the average score. 
		Make sure that the first entry of the CSV file is "Rollno, Subject1, Subject2, Average"

Note that the marks are not necessarily integers, so you may have to use bc to find the average and truncate the result to two decimal places.

comment


#!/bin/bash

num=$(cat data.csv | wc -l)
echo "Number of student entries = $(($num-1))"

for i in $(cat data.csv | grep -v "[a-z]")
do
Roll=$(echo $i | awk -F "," '{print $1}')
sub1=$(echo $i | awk -F "," '{print $2}')
sub2=$(echo $i | awk -F "," '{print $3}')
sum1=$(echo "scale=2;$sub1+$sub2" | bc)
avg=$(echo "scale=2;$sum1/2" | bc)
echo "Rollno ${Roll} | Subject 1 ${sub1} | Subject 2 ${sub2} | Average ${avg}"
done

for i in $(cat data.csv)
do
if [ $(echo $i | grep "R") ]
then
echo "$i,Average"
else
sub1=$(echo $i | awk -F "," '{print $2}')
sub2=$(echo $i | awk -F "," '{print $3}')
sum1=$(echo "scale=2;$sub1+$sub2" | bc)
avg=$(echo "scale=2;$sum1/2" | bc)
newLine="$i,$avg"
echo $newLine
fi
done >> out/result.csv
