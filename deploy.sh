#!/bin/bash

# script to create / delete file



# variables
option=$1
file=$2

#définir les fonctions
create_file(){
	touch $file
        echo "$file has been created"
}

delete_file(){
        rm -rf $file
        echo "$file has been deleted"
}

# conditions pour lancer la fonctions adéquate
if [ "$1" = "--create" ]; then
	create_file
elif [ "$1" = "--delete" ]; then
	delete_file
else
	echo "
	Options:
        	--create : to create file (touch)
        	--delete : to delete file/folder (rm -rf)

	"

fi
