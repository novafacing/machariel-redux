#! /bin/bash

#ubuntuScans.sh -- assists machariel.c, extends ubuntu scans, creates a file of all the pertinent information you could possiby want....
#CHECK THOUGH!

touch /machariel/logs/mediafiles
find / -maxdepth 100000 -iname *.mp3 -o -iname *.mp4 -o -iname *.mov -o -iname *.avi -o -iname *.mpg -o -iname *.flac -o -iname *.m4a -o -iname *.flv -o -iname *.mkv -o -iname *.ogg -o -iname *.gif -o -iname *.png -o -iname *.jpg -o -iname *.jpeg >> /machariel/logs/mediafiles
find /home -maxdepth 10000 >> /machariel/logs/homedirectoryfiles
sort -u /machariel/logs/homedirectoryfiles > /machariel/logs/homedirectoryfiles.new; rm /machariel/logs/homedirectoryfiles; mv /machariel/logs/homedirectoryfiles.new /machariel/logs/homedirectoryfiles
dpkg --list >> /machariel/logs/packageslist
dpkg --list | egrep 'downloader|mp3|music|video|torrent|media|cleaner|driver|crack|password|dictionary|table|server|listener|logger|key|keylogger|sniffer|ripper|hash|remote|viewer|rootkit|login|ftp|rainbow|hack|worm|trojan|' >> /machariel/logs/possiblebadpackages
sort -u /machariel/logs/packageslist > /machariel/logs/packageslist.new; rm /machariel/logs/packageslist; mv /machariel/logs/packageslist.new /machariel/logs/packageslist
sort -u /machariel/logs/possiblebadpackages > /machariel/logs/possiblebadpackages.new; rm /machariel/logs/possiblebadpackages; mv /machariel/logs/possiblebadpackages.new /machariel/logs/possiblebadpackages
find /usr/opt >> /machariel/logs/userinstalledfiles
find /usr/bin >> /machariel/logs/userinstalledfiles
find /usr/lib >> /machariel/logs/userinstalledfiles
find /usr/sbin >> /machariel/logs/userinstalledfiles
find /usr/local/bin >> /machariel/logs/userinstalledfiles
find /usr/share >> /machariel/logs/userinstalledfiles
sort -u /machariel/logs/userinstalledfiles > /machariel/logs/userinstalledfiles.new; rm /machariel/logs/userinstalledfiles; mv /machariel/logs/userinstalledfiles.new /machariel/logs/userinstalledfiles
find / -maxdepth 100000 -iname "vnc" -o  -iname "xtightvnc" -o -iname "nc" -o -iname "nc.traditional" -o -iname "netcat" -o -iname "smbd" -o -iname "samba" -o -iname "minerd" -o -iname "nginx" -o -iname "john" -o -iname "x11vnc" -o -iname "vnc4server" -o -iname "ssvnc" -o -iname "samba-server" -o -iname "samba-dev" -o -iname "samba-common" -o -iname "samba-vfs-modules" -o -iname "netcat-traditional" -o -iname "bind9" -o -iname "nginx-light" -o -iname "nginx-naxsi" -o -iname "john" -o -iname "nmap" -o -iname "aircrack-ng" -o -iname "openvas-server" -o -iname "wireshark" -o -iname "wireshark-common" -o -iname "wireshark-dev" -o -iname "tshark" -o -iname "ulogd2-pcap" -o -iname "snort" -o -iname "snort-common" -o -iname "tcpspy" -o -iname "netmate" -o -iname "reaver" -o -iname "wifite" -o -iname "nfs" -o -iname "rpc" -o -iname "oftc-hybrd" -o -iname "ircd-ratbox" -o -iname "ircd-ircu" -o -iname "ircd-hybrid" -o -iname "insiprcd" -o -iname "hydra" -o -iname "dns" -o -iname "ftp" -o -iname "metasploit" -o -iname "beef-xss" -o -iname "ettercap" > /machariel/logs/potentialfoundbadservices;
cd / && ls -laR 2> /dev/null | grep rwxrwxrwx | grep -v "lrwx" &> /machariel/logs/badpermissionfiles
sort -u /machariel/logs/badpermissionfiles >> /machariel/logs/badpermissionfiles.new; rm /machariel/logs/badpermissionfiles; mv /machariel/logs/badpermissionfiles.new /machariel/logs/badpermissionfiles
cut -d: -f1,3 /etc/passwd | egrep ':0$' | cut -d: -f1 | grep -v root >> /machariel/logs/zeroidusers; break;;
awk -F: '($2 == "") {print}' /etc/shadow >> /machariel/logs/emptypasswordaccounts
awk -F: '($3 == "0") {print}' /etc/passwd >> /machariel/logs/zeroidusers
netstat -tulpn >> /machariel/logs/listeningports
nmap -sT -O localhost >> /machariel/logs/listeningports
find / \( -perm -4000 -o -perm -2000 \) -print >> /machariel/logs/suidproblemfiles
find / -path -prune -o -type f -perm +6000 -ls >> /machariel/logs/problemfiles
find /dir -xdev -type d \( -perm -0002 -a ! -perm -1000 \) -print >> /machariel/logs/worldwritablefiles
find /dir -xdev \( -nouser -o -nogroup \) -print
