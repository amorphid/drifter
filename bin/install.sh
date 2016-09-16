#!/bin/bash

set -eux

source_bin=$(dirname $0)
source_home=$(cd $source_bin && cd .. & pwd)
target_bin=/usr/local/bin
target_home=/opt/drifter
target_lib=${target_home}/lib

# create executables directory
mkdir -p $target_bin

# create drifter executable
(
  executable=${target_bin}/drifter
  ${source_bin}/install/create_drifter.sh $target_lib $executable
)

# create drifter_command_help executable
(
  executable=${target_bin}/drifter_command_help
  ${source_bin}/install/create_drifter_command_help.sh $target_lib $executable
)

# copy source home to target home
cp -pR $source_home $target_home
