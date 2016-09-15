#!/bin/bash

set -eu

home=$1
executable=$2

# create executable
cat > $executable <<EOF
#!/bin/bash

set -eux

${home}/lib/drifter.sh "\$@"
EOF

# make executable bootable
chmod +x $executable
