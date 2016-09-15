#!/bin/bash

set -e -x

BOX=$1
BOX_DIR=${DRIFTER_BOXES}/${BOX}

echo TODO: add non-forced uninstall
(cd $BOX_DIR && vagrant destroy -f && cd .. && rm -rf $BOX_DIR)
