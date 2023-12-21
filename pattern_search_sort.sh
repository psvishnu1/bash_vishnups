<<comment
List all the files in the directory /var/log/ that ends with the pattern *.log. Then, sort the files according to the last modified time.

Write the required commands in the file q1.sh and output in out1.txt. The out1.txt is expected to be produced by running ./q1.sh > out/out1.txt.
comment

#!/bin/bash

# method1: reading using ls
ls -tr /var/log | grep "\.log$"

# method2: reading from syslog file
# grep -n "\.log" syslog

