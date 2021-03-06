#!/bin/bash

# Description : mon premier vrai script pour créer un backup

# variables
folders_to_backup="/home/user1 /etc/alsa"
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
    du -sh $backup_destination/$archive_file
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
main

exit 0
