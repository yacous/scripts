#!/bin/bash
# vérifier si le fichier / dossier est présent dans ce dossier

# variables :
msg_ok="Votre perle est bien là !"
msg_no="Nous sommes bien désolé !"
# $dest
# $name

# emplacement où vous voulez vérifier
read -p "Veuillez indiquer l'emplacement que vous voulez vérifier: " dest

# folder or file name
read -p "Veuillez indiquer le nom du dossier / fichier: " name

# fonction pour vérifier si le fichier est présent et afficher le msg
verif_and_msg() {
  if [[ -d $dest/$name ]] ; then
      echo -e "\033[1;32m$msg_ok\033[00m"
    elif [[ -f $dest/$name ]] ; then
      echo -e "\033[1;32m$msg_ok\033[00m"
    else
      echo -e "\033[1;31m$msg_no\033[00m"
  fi
}

verif_and_msg

# afficher la taille et envoyer le STDERR vers /dev/null
du -sh $dest/$name 2> /dev/null

exit 0
