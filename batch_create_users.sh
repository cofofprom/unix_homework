#!/bin/bash

dir=`dirname $0`
source_file="$dir/users_list.txt"

for line in `cat "$source_file"`; do
login=`echo "$line" | awk -F ',' {'print $1'}`
password=`echo "$line" | awk -F ',' {'print $2'}`

echo "Create user with login: $login..."

adduser $login &>> /dev/null << EOF
$password
$password




Y
EOF
if [ $? -ne 0 ];then
echo "error: User does not exist"
else
echo "done."
fi
echo ""
done
