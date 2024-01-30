# Wolfi-openssh-client

## About

This is a minimal "distroless" image that only contains alpine's openssh-client-default package and its dependencies.

## How

The container image is built using [`apko`](https://edu.chainguard.dev/open-source/apko/getting-started-with-apko/)

## Usage

The image has no entrypoint set, so you need to state the command that you want to execute, i.e.:  
`docker run -ti --rm -v <local path>:<container path> alestrix/wolfi-openssh-client:latest-amd64 <command> <parameters>`

For example  
`docker run -ti --rm -v ${PWD}/site:/site alestrix/wolfi-openssh-client:latest-amd64 scp -r "/site/*" web@server.tld:/var/www`  
(depending on your shell the `*` might have to be escaped)

Available commands are `scp`, `sftp`, and `ssh`.

Make sure to have all the directories (including local target directories when downloading to the host computer) and files
that you need available inside the container. A private key file can only be read by the UID of the owner, so you might
have to change the user the container is run as:

```
docker run -ti --rm -v /home/me/.ssh/id_ed25519:/id_key:ro --user $(id -u) -v /etc/passwd:/etc/passwd:ro -v /tmp/target:/target \
    alestrix/wolfi-openssh-client:latest-amd64 sftp -o StrictHostKeyChecking=no -i /id_key web@myserver.tld
```

