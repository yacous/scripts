#!/bin/bash

# Description : vérifier si le fichier / dossier est présent et afficher sa taille et son type

# variables :
msg_ok="Votre perle est bien là !"
msg_no="Nous sommes bien désolé !"
# $dest
# $name

# emplacement où vous voulez vérifier
read -p "Veuillez indiquer l'emplacement que vous voulez vérifier: " dest

# folder or file name
read -p "Veuillez indiquer le nom du dossier / fichier: " name

# fonction pour vérifier si le fichier est présent et afficher les détails
verif_and_msg() {
  if [[ -a $dest/$name ]] ; then
	echo -e "
\033[1;32m$msg_ok\033[00m"
	echo $dest/$name
	echo "Sa taille est de $(du -sh $dest/$name 2> /dev/null | awk -F "/" '{print $1}')"
	echo "Son type est $(file $dest/$name | awk -F ":" '{print $2}')
	     "
  else
	echo -e "
\033[1;31m$msg_no\033[00m
		"
  fi
}

clear

verif_and_msg

exit 0
