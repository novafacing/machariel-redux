#! /bin/bash

#apt-get install libpam-cracklib -y; tac /cp/logs/ifBackedUp; break;;
#echo -e "password	requisite  pam_cracklib.so retry=3 minlen=12 difok=3 reject_username minclass=3 maxrepeat=2 dcredit=2 ucredit=1 lcredit=1 ocredit=1 \npassword  requisite   pam_pwhistory.so    use_authtok  remember=5   enforce_for_root \npassword	[success=1 default=ignore]	pam_unix.so obscure use_authtok try_first_pass sha512 shadow \npassword requisite pam_deny.so \npassword required pam_permit.so \npassword optional pam_gnome_keyring.so" > /etc/pam.d/common-password; break;;
#echo -e "password	required	pam_cracklib.so retry=3 minlen=14 difok=6" >> /etc/pam.d/system-auth; break;;
#echo -e "auth required pam_tally2.so deny=5 unlock_time=900 onerr=fail audit even_deny_root_account silent \nauth	[success=1 default=ignore]	pam_unix.so nullok_secure \nauth requisite pam_deny.so \nauth required pam_permit.so \nauth optional pam_cap.so" > /etc/pam.d/common-auth; touch /etc/security/opasswd; chmod 644 /etc/security/opasswd
#echo -e "auth required /lib/security/\$ISA/pam_tally.so onerr=fail no_magic_root \naccount required /lib/security/\$ISA/pam_tally.so per_user deny=5 no_magic_root reset" >> /etc/pam.d/system-auth
#echo -e "MAIL_DIR /var/mail \nFAILLOG_ENAB yes \nLOG_UNKFAIL_ENAB no \nLOG_OK_LOGINS yes \nSYSLOG_SU_ENAB yes \nSYSLOG_SG_ENAB yes \nSULOG_FILE /var/log/sulog \nFTMP_FILE /var/log/btmp \nSU_NAME su \nHUSHLOGIN_FILE .hushlogin \nENV_SUPATH PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr \nbin:/sbin:/bin \nENV_PATH PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games \nTTYGROUP tty \nTTYPERM 0600 \nERASECHAR 0177 \nKILLCHAR 025 \nUMASK 022 \nPASS_MAX_DAYS 30 \nPASS_MIN_DAYS 14\nPASS_WARN_AGE 7 \nUID_MIN 1000 \nUID_MAX 60000 \nGID_MIN 1000 \nGID_MAX 60000 \nLOGIN_RETRIES 3 \nLOGIN_TIMEOUT 60 \nCHFN_RESTRICT rwh \nDEFAULT_HOME no \nUSERGROUPS_ENAB yes" > /etc/login.defs
#echo -e "Port 22 \nProtocol 2 \nHostKey /etc/ssh/ssh_host_rsa_key \nHostKey /etc/ssh \nssh_host_dsa_key \nHostKey /etc/ssh/ssh_host_ecdsa_key \nUsePrivilegeSeparation yes \nKeyRegenerationInterval 3600 \nServerKeyBits 768 \nSyslogFacility AUTH \nLogLevel INFO \nLoginGraceTime 60 \nPermitRootLogin no \nStrictModes yes \nRSAAuthentication yes \nPubkeyAuthentication yes \nIgnoreRhosts yes \nRhostsRSAAuthentication no \nHostbasedAuthentication no \nPermitEmptyPasswords no \nChallengeResponseAuthentication no \nPasswordAuthentication yes \nX11Forwarding no \nX11DisplayOffset 10 \nPrintMotd no \nPrintLastLog yes \nTCPKeepAlive yes \nAcceptEnv LANG LC_* \nSubsystem sftp /usr/lib/openssh/sftp-server \nUsePAM yes" > /etc/ssh/sshd_config
#echo -e "\nallow-guest=false" >> /etc/lightdm/lightdm.conf
#echo -e "kernel.kptr_restrict=2" > /etc/sysctl.d/10-kernel-hardening.conf
#echo -e "net.ipv4.conf.default.rp_filter=1\nnet.ipv4.conf.all.rp_filter=1\nnet.ipv4.tcp_syncookies=1\nnet.ipv4.conf.all.accept_redirects=0\nnet.ipv6.conf.all.accept_redirects=0\nnet.ipv4.conf.all.send_redirects=0\nnet.ipv4.conf.all.accept_source_route=0\nnet.ipv6.conf.all.accept_source_route=0\nnet.ipv4.conf.all.log_martians=1" > /etc/sysctl.conf; break;;
#echo -e "tmpfs     /dev/shm     tmpfs     defaults,noexec,nosuid     0     0" >> /etc/fstab
#chmod -R 755 /bin/; chmod 744 /etc/shadow; chown -R root:root /bin/; break;;
#sed -i "s/alias net-pf-10 ipv6/alias net-pf-10 off\nalias ipv6 off/" /etc/modprobe.d/aliases; break;;
#apt-get install audit
#/etc/init.d/auditd start
#auditctl -w /etc/shadow -k shadow-file -p rwxa
#auditctl -w /tmp -p e -k webserver0watch-tmp
#auditctl -w /etc/group -k group-file -p rxwa
#touch /cp/logs/checkthesemanually
#echo -e "/etc/resolv.conf \n /etc/hosts \n /etc/rc.local" > /cp/logs/checkthesemanually
#cat /etc/resolv.conf >> /cp/logs/checkthisfile; cat /etc/hosts >> /cp/logs/checkthisfile; cat /etc/rc.local >> /cp/logs/checkthisfile;
#echo -e "[SeatDefaults] \nallow-guest=false \ngreeter-hide-user=true \ngreeter-show-manual-login=true" > /etc/lightdm/lightdm.conf
#cd /etc/
#cd /etc/
#/bin/rm -f cron.deny at.deny
#echo root > cron.allow
#echo root > at.allow
#/bin/chown root:root cron.allow at.allow
#/bin/chmod 400 cron.allow at.allow

echo "THIS UTILITY IS IN SAFE MODE. UNCOMMENT TO ENABLE."
