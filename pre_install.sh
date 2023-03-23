#!/usr/bin/bash

apt-get -y update
apt-get -y install openssh-server
apt-get -y install apache2
apt-get -y install vim

sshd_config_file="/etc/ssh/sshd_config"
echo "Port 22" >> $sshd_config_file
echo "AddressFamily any" >> $sshd_config_file
echo "ListenAddress 0.0.0.0" >> $sshd_config_file
echo "ListenAddress ::" >> $sshd_config_file
echo "PermitRootLogin yes" >> $sshd_config_file

service ssh start
service apache2 start

echo "root:root" | chpasswd

#tail -f /dev/null
