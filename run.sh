#!/bin/sh

VOLPATH="`dirname \`realpath $0\``/volumes"

VERSION=$1

docker run --privileged=true \
           -w /root \
           -v ${VOLPATH}/ansible:/etc/ansible \
           -v ${VOLPATH}/custom-certs:/opt/custom-certs \
           -v ${VOLPATH}/pre-setup:/root/pre-setup \
           -v ${VOLPATH}/post-setup:/root/post-setup \
           -v ${VOLPATH}/setup:/root/setup \
           -it rhconsulting/ose-installer:$VERSION \
           /bin/bash

# vim: ts=2 et
