#/bin/bash


################################################################################
#                                                                              #
# Description : Script pour supprimer une adresse IP de /root/.ssh/known_hosts #
#                                                                              #
# Auteur : Yacous                                                              #
#                                                                              #
# Date : 04/11/2022                                                            #
#                                                                              #
# Utilisation : veuillez renseigner vos adresses IP dans un fichier ./ip.txt,  #
# puis lancez le script 'sh go_pass.sh, les adresses IP dont le mot de passe   #
# est correct seront renseignées dans le fichier ./hosts.txt                   #
#                                                                              #
################################################################################

# help en cas de besoin :

    if [[ $1 = "-help" ]]
    then
         head -n 17 sedip.sh | tail -n 15
         exit 0
    fi

# supprimer la ligne où il y a l'IP $1 du fichier /root/.ssh/known_hosts

sed -i /$1/d /root/.ssh/known_hosts

echo L\'adresse IP $1 n\'y est plus !
