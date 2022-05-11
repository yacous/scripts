#!/bin/bash

################################################################################
#                                                                              #
# Description : Script pour tester un mot de passe sur plusieurs IP en ssh     #
#                                                                              #
# Auteur : Yacous                                                              #
#                                                                              #
# Date : 11/05/2022                                                            #
#                                                                              #
# Utilisation : veuillez renseigner vos adresses IP dans un fichier ./ip.txt,  #
# puis lancez le script 'sh go_pass.sh, les adresses IP dont le mot de passe   #
# est correct seront renseignées dans le fichier ./hosts.txt                   #
#                                                                              #
################################################################################

# help en cas de besoin

if [ $1 = "-help" ]
then
    head -n 16 go_pass.sh | tail -n 15
    exit 0
fi


# décrlarer les variables :

ip=($(cat ip.txt))
user="root"


# demander le passwd

    echo -n 'Please enter the password : '
    read -s passwd
    printf "\n"


# boucle for pour le array de la variable $ip en totalité (@) puis sshpass user @ ip ($i), ensuite if host accessible stdout renvoyé vers le fichier hosts.txt, sinon msg 'pas accessible'
# stdout des cnx ssh est renvoyé vers /dev/null

for i in ${ip[@]}
do
    sshpass -p $passwd ssh -o ConnectTimeout=1 -o StrictHostKeyChecking=no -o GSSAPIAuthentication=no  $user@$i "printf $i" 2> /dev/null

    if [ $? = "0" ]
    then
        echo $i >> hosts.txt
        echo " a été ajoutée au fichier ./hosts.txt"
    else
        echo "$i n'est pas accessible"
    fi
done
