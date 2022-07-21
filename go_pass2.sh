#!/bin/bash

################################################################################
#                                                                              #
# Description : Script pour tester un mot de passe sur plusieurs IP en ssh     #
#                                                                              #
# Auteur : Yacous                                                              #
#                                                                              #
# Date : 20/06/2022                                                            #
#                                                                              #
# Utilisation : veuillez renseigner vos adresses IP dans un fichier ./ip.txt,  #
# puis lancez le script 'sh go_pass.sh, les adresses IP dont le mot de passe   #
# est correct seront renseignées dans le fichier ./hosts.txt                   #
#                                                                              #
################################################################################

# décrlarer les variables et l'array :

ip=($(cat ip.txt))
ip_list=${ip[@]}
pwd=($(cat pwd.txt))
pwd_list=${pwd[@]}
user="root"

# help en cas de besoin :

    if [[ $1 = "-help" ]]
    then
         head -n 16 go_pass.sh | tail -n 15
         exit 0
    fi


# boucle for pour le array de la variable $ip en totalité (@) puis sshpass user @ ip ($i), ensuite if host accessible stdout renvoyé vers le fichier hosts.txt,
# sinon msg 'pas accessible', stdout des cnx ssh est renvoyé vers /dev/null :

sshpass_launch(){

  for p in $pwd_list
  do
    echo $p
#    echo $p >> hosts.txt
      for i in $ip_list
      do
        sshpass -p $p ssh -o ConnectTimeout=1 -o StrictHostKeyChecking=no -o GSSAPIAuthentication=no  $user@$i "printf $i" 2> /dev/null

        if [ $? = "0" ]
        then
            echo $i >> $p.txt
            echo " a été ajoutée au fichier $p.txt"
        else
            echo "$i n'est pas accessible"
        fi
      done
  done
}

#lancer les fonctions (en cas de besoin, définir une fonction 'main' qui englobe toutes les fonctions et la lancer en une seule fois) :

sshpass_launch

exit 0
