# ssh-gateway

A lightweight SSH server for easy port forwarding

## Usage

```shell
make run
```

## Configuration

You may bind the SSH daemon to a different port (2222 in the example) and mount
a volume containing the servers keys and authorized_keys for the root user.

```shell
docker run --init --rm --name ssh-gateway -p 2222:22 -v /path/to/volume:/config:ro connesc/ssh-gateway
```

## Build

```shell
make build
```
