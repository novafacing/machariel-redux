#! /bin/bash

#while getopts "p:" opt; do
#  case $opt in
#    p ) set -f
#        IFS=' '
#        OPTIONS=($OPTARG);;
#    * )
#        clean_up
#        exit 1
#  esac
#done

#echo $OPTIONS

#PORTS=$( IFS=$'\n'; echo "${OPTIONS[@]}")
#PORTS=${PORTS%?}
#PORTS=${PORTS// /,}

#apt-get install iptables -y --force-yes --assume-yes
#iptables -S >> /machariel/logs/iptables.log
#mv ./rules.v4 /etc/iptables/rules.v4
#iptables -I INPUT 1 -i lo -j ACCEPT
#iptables -I INPUT 2 -p tcp -m tcp -m multiport ! --dports $PORTS -j DROP
#iptables -A INPUT -j DROP
#apt-get install iptables-persistent -y --force-yes --assume-yes
#invoke-rc.d iptables-persistent save
#mv ./rules.v6 /etc/iptables/rules.v6

echo "THIS UTILITY IS IN SAFE MODE. UNCOMMENT TO ENABLE."
