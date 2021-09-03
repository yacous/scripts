#!/bin/bash
# script to verify if I am root

verif_root(){
if [ "$EUID" = "0" ] ; then
	echo "
	Yes, you are ROOT
	"
else
	echo "
	No, you are not ROOT
	"
fi
}
verif_root
