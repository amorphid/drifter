#!/bin/bash

shell_script=$1
sub_command=${@:2:1}
sub_options=${@:3}

if [[ $sub_command == "" ]]; then
  drifter_command_help $shell_script
else
  ${shell_script%.sh}/${sub_command}.sh ${sub_options}  
fi
