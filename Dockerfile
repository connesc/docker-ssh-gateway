FROM alpine:3.6

RUN apk add --no-cache openssh

RUN mkdir /config \
	&& ln -s /config/host/ssh_host_dsa_key /etc/ssh/ssh_host_dsa_key \
	&& ln -s /config/host/ssh_host_dsa_key.pub /etc/ssh/ssh_host_dsa_key.pub \
	&& ln -s /config/host/ssh_host_ecdsa_key /etc/ssh/ssh_host_ecdsa_key \
	&& ln -s /config/host/ssh_host_ecdsa_key.pub /etc/ssh/ssh_host_ecdsa_key.pub \
	&& ln -s /config/host/ssh_host_ed25519_key /etc/ssh/ssh_host_ed25519_key \
	&& ln -s /config/host/ssh_host_ed25519_key.pub /etc/ssh/ssh_host_ed25519_key.pub \
	&& ln -s /config/host/ssh_host_rsa_key /etc/ssh/ssh_host_rsa_key \
	&& ln -s /config/host/ssh_host_rsa_key.pub /etc/ssh/ssh_host_rsa_key.pub \
	&& mkdir -p /root/.ssh \
	&& ln -s /config/user/authorized_keys /root/.ssh/authorized_keys

COPY entrypoint.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
