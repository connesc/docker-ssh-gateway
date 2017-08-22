#!/bin/sh

mkdir -p /config/host /config/user
ssh-keygen -A
touch /config/user/authorized_keys

exec /usr/sbin/sshd -D -e
