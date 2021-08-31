#!/bin/bash

echo "
Options:
	--create : to create file (touch)
	--delete : to delete file/folder (rm -rf)

"
option=$1
file=$2

create_file(){
	touch $file
        echo "$file has been created"
}

delete_file(){
        rm -rf $file
        echo "$file has been deleted"
}


if [ "$1" = "--create" ]; then
	create_file
elif [ "$1" = "--delete" ]; then
	delete_file
else
	echo "Please use an option"
fi
