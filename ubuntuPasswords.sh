#! /bin/bash

#while getopts "p:" opt; do
#  case $opt in
#    p ) set -f
#        PASSWORD=($OPTARG);;
#    * )
#        clean_up
#        exit 1
#  esac
#done

#echo "All users listed below"
#awk -F ':' '{ print $1}' /etc/shadow
#echo "root:$PASSWORD"| chpasswd
#passwd -l root
#read -p "Usernames, separated by spaces: " USERS
#    for word in $USERS; do
#        echo $word":$PASSWORD" | chpasswd
#    done; break;;

echo "THIS UTILITY IS IN SAFE MODE. UNCOMMENT TO ENABLE."
