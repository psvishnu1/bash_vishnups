<<comment

Write a single shell script which performs the following:

Find all the files in the directory /var/log that ends with .log.
Copy those files to the directory /tmp
For each of those files in /tmp add your roll number to the beginning of the file name

comment

#!/bin/bash

# method1: with cp only

cp -v /var/log/*.log /tmp
for i in $(cd /tmp && ls *.log);
do
mv "/tmp/$i" "/tmp/12213003_$i"
done

# method2: with xargs:

# ls -tr /var/log | grep "\.log$" | sed -e 's/^/\/var\/log\//' | xargs cp -vt /tmp
# for i in $(ls /tmp | grep "\.log");
# do
# mv "/tmp/$i" "/tmp/12213003_$i"
# done

# method3: with simpler sed

# ls -tr /var/log | grep "\.log$" | sed -e 's!^!/var/log/!' | xargs cp -vt /tmp
# for i in $(ls /tmp | grep "\.log");
# do
# mv "/tmp/$i" "/tmp/12213003_$i"
# done
