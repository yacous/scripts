#!/bin/bash

# Description : Script to create / delete file

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

details (){
	if [[ -a $file ]] ; then      
		echo $file
        	echo "Sa taille est de $(du -sh $file 2> /dev/null | awk -F "/" '{print $1}')"
        	echo "Son type est $(file $file | awk -F ":" '{print $2}')"
	else 
		echo "The File / Folder is not found"
	fi
}
show_options(){
        echo "
                Options:
                        --create  : to create file (touch)
                        --delete  : to delete file/folder (rm -rf)
			--details : to print file/folder details
			--help    : show help

        "

}

clear

# conditions pour lancer la fonction adéquate
if [ "$1" = "--create" ]; then
	create_file
elif [ "$1" = "--delete" ]; then
	delete_file
elif [ "$1" = "--details" ]; then
	details
elif [ "$1" = "--help" ]; then
	show_options
else
	echo "
	Please choose an option (deploy.sh --option file)"
	show_options
fi
