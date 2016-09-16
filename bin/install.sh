#!/bin/bash

set -eux

source_bin=$(dirname $0)
source_home=$(cd $source_bin && cd .. & pwd)
target_bin=/usr/local/bin
target_home=/opt/drifter
target_lib=${target_home}/lib
commands="
  drifter
  drifter_command_help
"

# create executables directory
mkdir -p $target_bin

# create  executables
(
  for command in $commands; do
    executable=${target_bin}/${command}
    template=$(cat ${source_bin}/install/${command}.txt)
    script=${template/{{target_lib\}\}/$target_lib}
    echo "$script" > $executable
    chmod +x $executable
  done
)

# copy source home to target home
cp -pR $source_home $target_home
