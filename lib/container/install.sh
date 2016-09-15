#!/bin/bash

set -e -x

CONTAINER=$1
CONTAINER_HOME=${DRIFTER_CONTAINER}/${CONTAINER}

mkdir -p ${CONTAINER_HOME}

# create container
debootstrap jessie $CONTAINER_HOME/rootfs

# copy drifter to container
cp -pR ${DRIFTER_HOME} $CONTAINER_HOME/usr/local/src

# install drifter
