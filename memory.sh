#!/bin/bash

#variables
ram_value=$(free -m | grep Mem | awk -F " " '{print $4}')

# afficher la RAM
echo $ram_value


#afficher un msg en fonction de la valeur RAM
if [[ $ram_value < 1024 ]] ; then
echo "OUT OF MEMORY !!"
else
echo "RAM en bonnes conditions"
fi
