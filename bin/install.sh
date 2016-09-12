#!/bin/bash

set -e -x

EXECUTABLE=/usr/local/bin/drifter
SOURCE=$( cd $(dirname $0) && cd .. && pwd)
TARGET=/opt/drifter

mkdir -p $TARGET
cp -pR ${SOURCE}/* $TARGET

mkdir -p $(dirname $EXECUTABLE)
cat > $EXECUTABLE <<EOF
#!/bin/bash

set -e

export DRIFTER_HOME=${TARGET}
export DRIFTER_LIB=\${DRIFTER_HOME}/lib
export DRIFTER_BOXES=\${HOME}/drifter_boxes
COMMAND=\$1
OPTIONS=\${@:2}

\${DRIFTER_LIB}/\${COMMAND}.sh \$OPTIONS
EOF
chmod +x $EXECUTABLE
