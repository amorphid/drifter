#!/bin/bash

set -e -x

PACKAGE=$1
OPTIONS=${@:2}

${DRIFTER_LIB}/package/install/${PACKAGE}.sh $OPTIONS
