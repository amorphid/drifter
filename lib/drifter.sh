#!/bin/bash

set -eux

shell_script=$0
options=$@

if [[ $options == "" ]]; then
  drifter_command_help $shell_script
else
  echo "it's alive!"
fi
