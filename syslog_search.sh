<<comment

Find the following information from the contents of syslog in your repo

Print every 5th entry of the file
Find all the lines containing the string "error" or "Error". Print the first 3 and the last 3 such messages
Write the required commands in the file q2.sh and output in out2.txt. The out2.txt is expected to be produced by running ./q2.sh > out/out2.txt.

comment

#!/bin/bash

# with no line number

# echo "Printing every 5th line of given record: "
# myFile=/home/user/cs5107/week10/syslog 
# awk 'NR % 5 == 0' $myFile
# echo "Finished printing 5th lines"

# echo "Now printing lines with errors: "
# echo "printing first 3 error lines: "
# grep -i -m 3 "error" $myFile
# echo "printing last 3 error lines: "
# grep -i "error" $myFile | tail -3
# echo "finished printing error lines."


# with line number:

echo "Printing every 5th line of given record: "
myFile=/home/user/cs5107/week10/syslog 
cat -n $myFile | awk 'NR % 5 == 0'
echo "Finished printing 5th lines"

echo "Now printing lines with errors: "
echo "printing first 3 error lines: "
# grep -i -m 3 "error" $myFile
grep -i "error" $myFile | head -3
echo "printing last 3 error lines: "
grep -i "error" $myFile | tail -3
echo "finished printing error lines."
