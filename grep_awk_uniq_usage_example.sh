<<comment

Print the information in /etc/services as per the specifications given below using a bash script.

	1) Ignore all the content that start with a # throughout the file.
	2) The file /etc/services has three columns separated by a single spaced tab as follows. We give below five lines from this file.

			tcpmux          1/tcp                           # TCP port service multiplexer
			echo            7/tcp
			echo            7/udp
			discard         9/tcp           sink null
			discard         9/udp           sink null
			
This should be displayed as follows with the columns separated by single spaced tabs. 
Note that certain protocols appear in multiple lines in /etc/services but the final output should merge them in a single line as shown.

			Service     TCP UDP Alt
			tcpmux      1   -   -
			echo        7   7   -
			discard     9   9   sink null
			
	3) Your script should handle all the entries in the file /etc/services.


Implementation Milestones/Check points Given below is a set of steps that may be followed to produce the desired output.

	Step 1. Generate a new file essential_rows.txt with all the text beginning with a has as well as empty lines removed.

	Step 2. Find the unique list of services in a file service_names.txt

	Step 3. Generate the final output using essential_rows.txt and service_names.txt and display it in the terminal.

comment

#!/bin/bash

# cat /etc/services | while read line
# do
# if [ "$line" != "" ]
# then
# echo $line
# fi
# done >> temp
# cat temp | grep -v "^#" > essential_rows.txt

cat /etc/services | while read line
do
if [ "$line" != "" ]
then
echo $line | grep -v "^#"
fi
done > essential_rows.txt

cat essential_rows.txt | awk '{print $1}' > temp
cat temp | uniq > service_names.txt
rm temp

init="0"
for i in $(cat service_names.txt)
do
if [ "$init" = "0" ]
then
echo "Service TCP UDP Alt"
init=$(($init+1))
fi
p1=$(grep "^$i" essential_rows.txt | awk '{print $2}'| grep "tcp" | awk -F "/" '{print $1}')
p2=$(grep "^$i" essential_rows.txt | awk '{print $2}'| grep "udp" | awk -F "/" '{print $1}')
echo "$i $p1 $p2"
done
