#! /bin/bash
# ubuntuBackup.sh -- Extends machariel.c, backs up key files to the /machariel directory tree as well as creating .bak's in the file directory. Be careful with these in active A/D scenarios (you MIGHT want to restrict them!)
#cp /etc/apt/sources.list /etc/apt/sources.list.bak
#cp /etc/apt/sources.list /machariel/backup/sources.list.bak
#cp /etc/apt/apt.conf.d/10periodic /etc/apt/apt.conf.d/10periodic.bak
#cp /etc/apt/apt.conf.d/10periodic /machariel/backup/10periodic.bak
#cp /etc/apt/apt.conf.d/50unattended-upgrades /etc/apt/apt.conf.d/50unattended-upgrades.bak
#cp /etc/apt/apt.conf.d/50unattended-upgrades /machariel/backup/50unattended-upgrades.bak
#cp /etc/apt/apt.conf.d/20auto-upgrades /etc/apt/apt.conf.d/20auto-upgrades
#cp /etc/apt/apt.conf.d/20auto-upgrades /machariel/backup/20auto-upgrades
#cp /etc/pam.d/common-password /etc/pam.d/common-password.bak
#cp /etc/pam.d/common-password /machariel/backup/common-password.bak
#cp /etc/pam.d/common-auth /etc/pam.d/common-auth.bak
#cp /etc/pam.d/common-auth /machariel/backup/common-auth.bak
#cp /etc/login.defs /etc/login.defs.bak
#cp /etc/login.defs /machariel/backup/login.defs.bak
#cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
#cp /etc/ssh/sshd_config /machariel/backup/sshd_config.bak
#cp -av /etc/init.d /machariel/backup/init.d.bak
#cp /etc/shadow /etc/shadow.bak
#cp /etc/shadow /machariel/backup/shadow.bak
#cp /etc/group /etc/group.bak
#cp /etc/group /machariel/backup/group.bak
#cp /etc/sudoers /etc/sudoers.bak
#cp /etc/sudoers /machariel/backup/sudoers.bak
#cp /etc/sysctl.conf /etc/sysctl.conf.bak
#cp /etc/sysctl.conf /machariel/backup/sysctl.conf.bak
#cp /etc/fstab /etc/fstab.bak
#cp /etc/fstab /machariel/backup/fstab.bak
#cp /etc/pam.d/su /etc/pam.d/su.bak
#cp /etc/pam.d/su /machariel/backup/su.bak
#cp /etc/passwd /etc/passwd.bak
#cp /etc/passwd /machariel/backup/passwd.bak

echo "THIS SCRIPT IS CURRENTLY IN SAFE MODE. UNCOMMENT TO ENABLE"
