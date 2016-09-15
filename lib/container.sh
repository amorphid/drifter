#!/bin/bash

set -e -x

COMMAND=$1
OPTIONS=${@:2}

${DRIFTER_LIB}/container/${COMMAND}.sh $OPTIONS
