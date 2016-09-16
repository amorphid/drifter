#!/bin/bash

set -eux

source_bin=$(dirname $0)
source_home=$(cd $source_bin && cd .. & pwd)
target_bin=/usr/local/bin
target_home=/opt/drifter
target_lib=${target_home}/lib
command_templates="
  drifter
  drifter_command_help
"

commands="
  drifter_command_run
"

# create executables directory
mkdir -p $target_bin

# create executables from templates
(
  for command in $command_templates; do
    executable=${target_bin}/${command}
    template=$(cat ${source_bin}/install/${command}.txt)
    script=${template/{{target_lib\}\}/$target_lib}
    echo "$script" > $executable
    chmod +x $executable
  done
)

# copy executables
(
  for command in $commands; do
    executable=${target_bin}/${command}
    cp -p ${source_bin}/install/${command}.sh $executable
  done
)

# copy source home to target home
cp -pR $source_home $target_home
