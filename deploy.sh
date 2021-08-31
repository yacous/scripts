#!/bin/bash

echo "
Options:
	--create : to create file (touch)
	--delete : to delete file/folder (rm -rf)
"
if [ "$1" = "--create" ]; then
	touch $2
	echo $2 has been created
elif [ "$1" = "--delete" ]; then
	rm -rf $2
	echo $2 has been deleted
fi
