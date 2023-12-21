<<comment

Write a shell script that does the following:

Use find to get a list of all files matching a pattern *.postinst in /var/lib/dpkg/info
Save the files found in the previous step to a variable $matched_files.
Iterate over the files in $matched_files and copy each of the file found to /tmp and add the file size in bytes as prefix to the filename.
Write the shell commands in a file script.sh. The file must be committed to the repo. 

comment

#!/bin/bash

matched_files=$(find /var/lib/dpkg/info -name "*.postinst")
for i in $matched_files
do
cp $i /tmp
done
for j in $(cd /tmp && ls *.postinst)
do
size=$(cd /tmp && ls -l $j | awk -F " " '{print $5}')
mv /tmp/$j /tmp/$size\_$j
done
