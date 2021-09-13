#!/bin/bash
# Description : script to verify if the current user is root

verif_root(){
if [ `whoami` = 'root' ] ; then
	echo "
	Yes, you are ROOT
	"
else
	echo "
	No, you are $(whoami)
	You don't have permissions to run $0	
"
fi
}

clear

verif_root

exit 0

# or 
# echo  NO you are `whoami`
