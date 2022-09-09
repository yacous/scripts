#/bin/bash

################################################################################
#                                                                              #
# Description :                                                                #
#                                                                              #
# Auteur : Yacous                                                              #
#                                                                              #
# Date : 21/07/2022                                                            #
#                                                                              #
# Utilisation :                                                                #
#                                                                              #
#                                                                              #
#                                                                              #
################################################################################

# décrlarer les variables :

file1=all_vm_info.txt
file2=all_ip.txt

echo Launching Ansible playbook : 3.scan.yml
ansible-playbook 3.scan.yml > $file1
echo Extracting IPs
cat $file1 | grep ip_address | awk -F '"' '{print $4}' | sed '/^$/d' > $file2
echo Finished
echo Your files are : $file1 and and $file1
