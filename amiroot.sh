#!/bin/bash
# script to verify if the current user is root

verif_root(){
if [ "$EUID" = "0" ] ; then
	echo "
	Yes, you are ROOT
	"
else
	echo "
	No, you are $(whoami)
	"
fi
}
verif_root

# or 
# echo  NO you are `whoami`
