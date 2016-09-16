#!/bin/bash

set -eux

home=$1
executable=$2

# create executable
cat > $executable <<EOF
#!/bin/bash

set -eux

${home}/drifter.sh "\$@"
EOF

# make executable bootable
chmod +x $executable
