#!/bin/bash

set -e +x

COMMAND=$1
OPTIONS=${@:2}

${DRIFTER_LIB}/box/${COMMAND}.sh $OPTIONS