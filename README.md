# General Purpose Development Environment

General purpose development environment (OS: latest release of Ubuntu).

## Before You Start

Copy your public key here for remote login.

## Build

```bash
docker-compose build --build-arg TZ=$TZ --build-arg user=$USER --build-arg uid=$UID --build-arg gid=$GID
```

## Run

```bash
docker-compose up
```

The port for SSH service is mapped to port 22022 of host OS. To connect:

```bash
ssh -o "StrictHostKeyChecking=no" localhost -p 22022 -i id_rsa
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

