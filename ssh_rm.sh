#/bin/bash


################################################################################
#                                                                              #
# Description : Script pour supprimer une adresse IP de /root/.ssh/known_hosts #
#                                                                              #
# Auteur : Yacous                                                              #
#                                                                              #
# Création : 04/11/2022         Update : 06/01/2023                            #
#                                                                              #
# Utilisation : veuillez renseigner vos adresses IP dans un fichier ./ip.txt,  #
#                                                                              #
#                                                                              #
#                                                                              #
################################################################################

# help en cas de besoin :

    if [[ $1 = "-help" ]]
    then
         head -n 17 ssh_rm.sh | tail -n 15
         exit 0
    fi

# supprimer la ligne où il y a l'IP $1 du fichier /root/.ssh/known_hosts

ip=$1
path="/root/.ssh/known_hosts"

grep $1 $path

if [[ $? = "1" ]]
then
  echo "L'adresse IP $1 n'est pas présente dans le fichier $path"
  exit 0
else
  echo -n "Do you want to delete $ip from $path ? (y/n)"
  read delete

  if [[ $delete = "y" ]]
  then
    sed -i /$ip/d $path
    echo "L'adresse IP $ip vient d'être supprimée "
    echo -n "Do you want to connect to $ip ? (y/n)"
    read connect

    if [[ $connect = "y" ]]
    then
      ssh root@$ip
    elif [[ $connect = "n" ]]
    then
      echo "exit"
      exit 0
    else
      echo "choix non reconnu ! "
      exit 0
    fi

  elif [[ $delete = "n" ]]
  then
    echo "aucune entrée n'a été supprimé"
    echo "exit"
    exit 0
  else
    echo "choix non reconnu ! "
    echo "exit"
    exit 0
  fi
fi
