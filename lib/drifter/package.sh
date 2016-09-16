#!/bin/bash

set -eux

shell_script=$0
options=$@

drifter_command_run $shell_script $options
