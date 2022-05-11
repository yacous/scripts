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
