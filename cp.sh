#!/bin/bash
 
# Description : boucle for pour copier les tous fichiers sh vers /tmp/scripts
 
for fichier in `ls *.sh`
do
        cp $fichier /tmp/scripts
done

exit 0
