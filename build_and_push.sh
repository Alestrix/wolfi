docker run --rm -v ${PWD}:/work cgr.dev/chainguard/apko build --arch x86_64 /work/apko-openssh-client.yaml alestrix/wolfi-openssh-client:latest /work/wolfi-openssh-client.tar
docker load < wolfi-openssh-client.tar
docker push alestrix/wolfi-openssh-client:latest-amd64