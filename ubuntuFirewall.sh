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
#iptables -F
#iptables -A INPUT -p udp -j REJECT --reject-with icmp-port-unreachable
#iptables -A INPUT -p tcp -j REJECT --reject-with tcp-reset
#iptables -A INPUT -j REJECT --reject-with-icmp-proto-unreachable
#echo $PORTS
#iptables -A INPUT -p tcp -m tcp -m multiport ! --dports $PORTS -j DROP

echo "THIS UTILITY IS IN SAFE MODE. UNCOMMENT TO ENABLE."
