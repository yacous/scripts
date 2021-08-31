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

show_options(){
        echo "
                Options:
                        --create : to create file (touch)
                        --delete : to delete file/folder (rm -rf)

        "

}

# conditions pour lancer la fonction adéquate
if [ "$1" = "--create" ]; then
	create_file
elif [ "$1" = "--delete" ]; then
	delete_file
else
	show_options
fi
