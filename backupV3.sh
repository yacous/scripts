#!/bin/bash

######################################################################################################################
#						       								     #
# Description : script pour créer un backup (version 3)								     #
#						       								     #
# Auteur : Yacous				       								     #
#						       								     #
# Date : 16/09/2021				       								     #
#						       								     #
# Utilisation:													     #
# Veuillez lancer le backup sous cette forme de : $ sh backupV3.sh file folder					     #
# 'file' est le fichier txt qui contient les fichiers / dossiers à sauvegarder, 'folder' est l'emplacement du backup #
#														     #
######################################################################################################################

# variables and arrays

file=$1
folders_to_backup=$(cat $file 2> /dev/null)
backup_destination=$2
log_files=(/var/log/backup_logs /var/log/backup_error)

# declarer les fonctions
create_folder_filename(){
        day=$(date +%F)
        hostname=$(hostname -s)
        folder_name="$hostname-$day"
}

print_start_status_message(){
        date
	printf "Backing up files to $backup_destination/$folder_name :\n$folders_to_backup\nbash_history\n"
}

save_bash_history(){
	echo bash_history >> $file
        cp $HOME/.bash_history bash_history

	# variable update (bash_history added to $file)
	folders_to_backup=$(cat $file)
}

backup_and_logs(){
        mkdir -p $backup_destination/$folder_name

	# boucle pour ajouter la date et l'heure aux deux fichiers logs
	for i in ${log_files[@]} ; do
		echo $(date +%F_%R: ) > $i
	done
	
	# copier les fichiers et envoyer le stdout vers le backup_logs et le stderr vers backup_error
	cp -v -r $folders_to_backup $backup_destination/$folder_name 1>> ${log_files[0]} 2>> ${log_files[1]}
	rm bash_history
}

print_end_status_message(){
        printf "\nBackup Finished !\nto check logs: "
	echo ${log_files[@]}
	date
}

estimate_file_space_usage(){
        du -sh $backup_destination/$folder_name 2> /dev/null
	echo
}

main(){
	create_folder_filename
	print_start_status_message
	save_bash_history
	backup_and_logs
	print_end_status_message
        estimate_file_space_usage
}

clear

# if $1 est un fichier et $2 dossier, lancer fonction main, sinon msg d'erreur et exit 1
if [ -f $1 ] && [ -d $2 ] ; then
	main
else
	printf "\nVeuillez indiquer les dossiers à sauvegarder sous forme de :\n
  # sh script.sh txt_file folder_destination\n\n"
	exit 1
fi

exit 0
