<<comment

For the file /etc/passwd - print details of all users who are not allowed to login - Also print the number of such users

Write the required commands in the file q3.sh and output in out3.txt. The out3.txt is expected to be produced by running ./q3.sh > out/out3.txt.

[Hint: Users who are not allowed to login will have their shell set as /usr/sbin/nologin. You may want to read about the command wc in info wc]

comment

#!/bin/bash

# method1: with wc

grep "usr/sbin/nologin" /etc/passwd
myNum=$(grep "usr/sbin/nologin" /etc/passwd | wc -l)
echo "Number of users not allowed to login = $myNum"

# method2: without wc

# grep "usr/sbin/nologin" /etc/passwd
# myNum=$(grep -c "usr/sbin/nologin" /etc/passwd)
# echo "Number of users not allowed to login = $myNum"
