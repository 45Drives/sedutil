#!/bin/bash

CONTAINER_BINARY=/usr/bin/podman

$CONTAINER_BINARY build -t sedutil-builder -f Dockerfile
res=$?
if [ $res -ne 0 ]; then
	echo "Building $(basename sedutil-builder) image failed."
	exit $res
fi

$CONTAINER_BINARY run --rm -it \
    -v ./..:/root/sedutil \
    sedutil-builder bash /root/build.sh
