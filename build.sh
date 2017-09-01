#!/bin/sh

BUILDDIR=`dirname \`realpath $0\``
pushd ${BUILDDIR}
docker build -t rhconsulting/ose-installer:3.6 .
popd
