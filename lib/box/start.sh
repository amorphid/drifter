#!/bin/bash

set -e +x

BOX=$1

(cd ${DRIFTER_BOXES}/${BOX} && vagrant up)
