#!/bin/bash

set -eux

BOX=$1

(cd ${DRIFTER_BOXES}/${BOX} && vagrant ssh)
