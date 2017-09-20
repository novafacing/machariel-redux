#! /bin/bash

while getopts "p:i:" opt; do
  case $opt in
    p ) set -f
        IFS=' '
        OPTIONS=($OPTARG);;
    i ) set -f
        IFS=' '
        SOPTIONS=($OPTARG);;
    * )
        clean_up
        exit 1
  esac
done

echo $OPTIONS
echo $SOPTIONS
echo $WOPTIONS

PORTS=$( IFS=$'\n'; echo "${OPTIONS[@]}")
PORTS=${PORTS// /,}

apt-get install iptables -y --force-yes --assume-yes
iptables -S >> /machariel/logs/iptables.log
mv ./rules.v4 /etc/iptables/rules.v4
iptables -I INPUT 1 -i lo -j ACCEPT
iptables -A INPUT -m state --state RELATED,ESTABLISHED -m limit --limit 10/second --limit-burst 150 -j ACCEPT
iptables -A INPUT -m conntrack --ctstate NEW -m limit --limit 10/second --limit-burst 150 -j ACCEPT
iptables -I INPUT 2 -p tcp -m tcp -m multiport --dports $PORTS -j ACCEPT
iptables -A INPUT -j DROP
apt-get install iptables-persistent -y --force-yes --assume-yes
invoke-rc.d iptables-persistent savel
mv ./rules.v6 /etc/iptables/rules.v6

echo "THIS UTILITY IS IN SAFE MODE. UNCOMMENT TO ENABLE."
