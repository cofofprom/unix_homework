#!/bin/bash

dir=`dirname $0`
source_file="$dir/users_list.txt"

mkdir "$dir/backup" &>> /dev/null

for line in `cat "$source_file"`; do
login=`echo "$line" | awk -F ',' {'print $1'}`
echo "Deleting user $login..."
if [ "$1" == "with-backup" ]; then
backup_name="$dir/backup/$login.tar"
tar -cf "$backup_name" "/home/$login" &>> /dev/null 
fi
deluser --remove-home "$login" &>> /dev/null
if [ $? -ne 0 ]; then
echo "error: User does not exist"
else
echo "done."
fi
echo ""
done
