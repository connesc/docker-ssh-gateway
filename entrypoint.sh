#!/bin/sh

host_keys='ssh_host_dsa_key ssh_host_ecdsa_key ssh_host_ed25519_key ssh_host_rsa_key'

for file in $host_keys
do
	if [ -f /config/$file ]
	then install -D -o root -g root -m600 /config/$file /etc/ssh/$file
	fi

	if [ -f /config/$file.pub ]
	then install -D -o root -g root -m644 /config/$file.pub /etc/ssh/$file.pub
	fi
done

ssh-keygen -A

if [ -f /config/authorized_keys ]
then install -D -o root -g root -m600 /config/authorized_keys /root/.ssh/authorized_keys
fi

exec /usr/sbin/sshd -D -e
