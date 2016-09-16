#!/bin/bash

set -eux

if [[ $@ ]]; then
  echo $@
else
  echo no cash for you
fi

# box=$1

# box=$1
# box_dir=${DRIFTER_BOXES}/${box}
#
# echo TODO: add non-forced uninstall
# (cd $box_dir && vagrant destroy -f && cd .. && rm -rf $box_dir)
