# General Purpose Development Environment

General purpose development environment (base image: `ubuntu:rolling`).

## Before You Start

Copy your public key here or generate a new key pair using `ssh-keygen` for remote login.

**Note**: if you don't do this manually, `make` will copy the `id_rsa.pub` file from `$HOME/.ssh/id_rsa.pub`.

## Build

```bash
make  # Or ./build-container.sh
```

The user name, user ID and group ID settings are taken from current user (non-root assumed).
For example, if you build the container as user `foo` whose user ID and group ID is `1000` and `1000` respectively,
a user `foo` will be created with the user ID `1000` and the group ID `1000` inside the container (and added as a sudoer).
The timezone value is read from `/etc/timezone`.

## Run

```bash
./up.sh
```

Or with privilege:

```bash
PRIV=true ./up.sh
```

The port for SSH service is mapped to port 22022 of host OS. To connect:

```bash
ssh -o "StrictHostKeyChecking=no" localhost -p 22022 [-i id_rsa]
```

## Preinstalled Packages

* sudo
* build-essential
* curl
* wget
* vim
* git
* ssh
* Node.js

## Useful Scripts

### `up.sh`

Bring up the container, optionally with privilege.

Usage: `[PRIV=true|false] ./up.sh`.

A `ip.txt` file containing the IP of the container will be created in current working directory.

### `down.sh`

Bring down the container.

Usage: `./down.sh`.

### `exec.sh`

Execute a command inside the container. Shortcut of `docker exec -u $(id -u) -it $CONTAINER_NAME <command> [...]`.

Usage: `./exec.sh <command> [...]`.

### `bash.sh`

Start `/bin/bash` inside the container, same with `./exec.sh /bin/bash [...]`.

### `build-container.sh`

Build the container.

Usage:

```bash
./build-container.sh
```
