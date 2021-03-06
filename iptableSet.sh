#!/bin/bash
while getopts "g:b:i:o:e:" opt; do
    case $opt in
		b ) set -f
			IFS = ' '
			BDOPTIONS = ($OPTARG);;
        e ) set -f
            IFS = ' '
            EXOPTIONS = ($OPTARG);;
		g ) set -f 
			IFS = ' '
			GDOPTIONS = ($OPTARG);;
        i ) set -f 
            IFS = ' '
            INOPTIONS = ($OPTARG);;
		o ) set -f
			IFS = ' '
			OUOPTIONS = ($OPTARG);;
        * )
            clean_up
            exit 1
    esac
done

echo $EXOPTIONS

EXTPORTS = $( IFS = $'\n'; echo "${OPTIONS[@]}")
EXTPORTS = ${ EXTPORTS// /,}
INTPORTS = $( IFS = $'\n'; echo "${OPTIONS[@]}")
INTPORTS = ${ INTPORTS// /,}
OUTPORTS = $( IFS = $'\n'; echo "${OPTIONS[@]}")
OUTPORTS = ${ OUTPORTS// /,}

apt install iptables -y --force-yes
iptabes -S >> machariel/logs/iptables.log

# Interfaces
int_if="eth1"
ext_if="eth0"
loop="lo"

# My other slices
int_goodguys_ip=( "x.x.x.x/32" )
# allowed people to restricted external ports
ext_goodguys_ip=( "x.x.x.x/32" "x.x.x.x/32" )

#allowed tcp & udp ports for external INPUT
in_tcp_ports_ext=($EXTPORTS)
in_udp_ports_ext=()
#allowed tcp & udp on internal
in_tcp_ports_int=($INTPORTS)
in_udp_ports_int=()

#allowed ports for outbound traffic OUTPUT
out_ports=($OUTPORTS)

IPTABLES=/sbin/iptables

# first flush all loaded rules, and delete them
${IPTABLES} -F
${IPTABLES} -X
# set up a default drop policy from here out if we want it to work we must accept..
${IPTABLES} -P INPUT   DROP
${IPTABLES} -P OUTPUT  DROP
${IPTABLES} -P FORWARD DROP

echo "[+] Setting up INPUT Chains..."
# state tracking...
${IPTABLES} -A INPUT -m state --state INVALID -j LOG --log-prefix "DROP INVALID " --log-ip-options --log-tcp-options
${IPTABLES} -A INPUT -m state --state INVALID -j DROP
${IPTABLES} -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
#allow loop traffic
${IPTABLES} -A INPUT -d 127.0.0.0/8 -i ${loop} -j ACCEPT

#accept rules on ext interface
# allowed inbound TCP ports on external
for port in ${in_tcp_ports_ext[@]}
do
  ${IPTABLES} -A INPUT -i ${ext_if} -p tcp --dport ${$EXTPORTS} --syn -m state --state NEW -j ACCEPT
done
# allowed inbound UDP ports on external
#for port in ${in_udp_ports_ext[@]}
#do
#  ${IPTABLES} -A INPUT -i ${ext_if} -p udp --dport ${port} -j ACCEPT
#done
# allowed inbound Traffic from allowed IPs to port 9999
# if you had more services that need to restrict access
# you could make an array here for port numbers too
# something like 3306, 4949, etc.. or you could add the
# lines statically like I have here for my 1 service
for goodguy in ${ext_goodguys_ip[@]}
do
  ${IPTABLES} -A INPUT -i ${ext_if} -s ${goodguy} -p tcp --dport 9999 -j ACCEPT
done

#rule for ping
iptables -A INPUT -p icmp -m icmp --icmp-type address-mask-request -j DROP
iptables -A INPUT -p icmp -m icmp --icmp-type timestamp-request -j DROP
iptables -A INPUT -p icmp -m icmp --icmp-type 8 -m limit --limit 5/second -j ACCEPT

#accept rules on internal interface
# but only from allowed hosts.. dont need anyone but me for this traffic
for good_guy in ${int_goodguys_ip[@]}
do
  for port in ${in_tcp_ports_int[@]}
  do
    ${IPTABLES} -A INPUT -i ${int_if} ! -s ${good_guy} -p tcp --dport ${port} -j LOG --log-prefix "DROP INTERNAL NOTME " --log-ip-options --log-tcp-options
    ${IPTABLES} -A INPUT -i ${int_if} -s "${good_guy}" -p tcp --dport ${port} -j ACCEPT
  done
  for uport in ${in_udp_ports_int[@]}
  do
    ${IPTABLES} -A INPUT -i ${int_if} ! -s ${good_guy} -p udp --dport ${uport} -j LOG --log-prefix "DROP INTERNAL NOTME " --log-ip-options --log-tcp-options
    ${IPTABLES} -A INPUT -i ${int_if} ! -s ${good_guy} -p udp --dport ${uport} -j DROP
  done
done
echo "[+] Setting up OUTPUT Chains..."
# State Tracking
${IPTABLES} -A OUTPUT -m state --state INVALID -j LOG --log-prefix "DROP INVALID " --log-ip-options --log-tcp-options
${IPTABLES} -A OUTPUT -m state --state INVALID -j DROP
${IPTABLES} -A OUTPUT -m state --state  ESTABLISHED,RELATED -j ACCEPT
# allowed tcp traffic for outbound
for port in ${out_ports[@]}
do
  ${IPTABLES} -A OUTPUT -p tcp --dport ${port} --syn -m state --state NEW -j ACCEPT
done
# allowed udp traffic for outbound
${IPTABLES} -A OUTPUT -p udp --dport 53 -j ACCEPT
# allow local users to ping outside machines
${IPTABLES} -A OUTPUT -p icmp --icmp-type echo-request -j ACCEPT
${IPTABLES} -A OUTPUT -p udp --dport 123 -j ACCEPT
