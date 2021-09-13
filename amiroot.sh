#!/bin/bash
# Description : script to verify if the current user is root

verif_root(){
if [ `whoami` = 'root' ] ; then
	printf "\nYes, you are Root\n\n"
else
	printf "\nNo, you are $(whoami)\n
You don't have permissions to run $0\n\n"
fi
}

clear

verif_root

exit 0

# or 
# echo  NO you are `whoami`
