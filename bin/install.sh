#!/bin/bash

set -e -x

EXECUTABLES_HOME=/usr/local/bin
SOURCE_BIN=$(dirname $0)
SOURCE_HOME=$(cd $SOURCE_BIN && cd .. && pwd)
TARGET_HOME=/opt/drifter

# create target directory
mkdir -p $TARGET_HOME

# copy source files to target directory
cp -pR ${SOURCE_HOME}/* $TARGET_HOME

# create executables directory
mkdir -p $EXECUTABLES_HOME

# create drifter script
cat > $EXECUTABLES_HOME/drifter <<EOF
#!/bin/bash

set -e

export DRIFTER_HOME=${TARGET_HOME}
export DRIFTER_LIB=\${DRIFTER_HOME}/lib
export DRIFTER_BOXES=\${HOME}/.drifter/boxes
export DRIFTER_CONTAINERS=\${HOME}/.drifter/containers
COMMAND=\$1
OPTIONS=\${@:2}

\${DRIFTER_LIB}/\${COMMAND}.sh \$OPTIONS
EOF

# make drifter script executable
chmod +x $EXECUTABLES_HOME/drifter

# copy drifter-hostname executable
cp -p ${SOURCE_BIN}/drifter-hostname.sh ${EXECUTABLES_HOME}/drifter-hostname
