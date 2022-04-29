#!/bin/bash

dir=`dirname $0`
result_file="$dir/users_list.txt"

count_users=50

rm $result_file

for i in `seq -w 1 $count_users`; do

login="user$i"
password=`pwgen 8 1`

line="$login,$password"

echo "$line" >> $result_file

#[ $i -eq 10 ] && exit 7

done

