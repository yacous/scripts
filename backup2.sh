#!/bin/bash
# Description : Mon premier vrai script pour créer un backup v2
# Veuillez indiquer les dossiers à sauvegarder sous forme de : $ sh script.sh /tmp/folder1 /tmp/file2 /etc

# variables
folders_to_backup=$@
backup_destination="/tmp/backup"

# declarer les fonctions
create_archive_filename(){
        day=$(date +%A)
        hostname=$(hostname -s)
        archive_file="$hostname-$day.tgz"
}

print_start_status_message(){
        date
        echo "Backing up $folders_to_backup to $backup_destination/$archive_file"
        }

backup_files(){
        tar czfP $backup_destination/$archive_file $folders_to_backup --absolute-names
}

print_end_status_message(){
        echo "Backup finished"
        date
}

estimate_file_space_usage(){
        du -sh $backup_destination/$archive_file 2> /dev/null
}

main(){
        create_archive_filename
        print_start_status_message
        backup_files
        print_end_status_message
        estimate_file_space_usage
}

clear

# lancer la fonction main qui englobe toutes les fonctions
# if -z : si $1 est vide then echo, sinon main
if [ -z $1 ] ; then
	echo "
	Veuillez indiquer les dossiers à sauvegarder sous forme de : $ sh script.sh /tmp/folder1 /tmp/file2 /etc
	"
	exit 1
else
	main
fi
