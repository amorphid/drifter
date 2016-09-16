#!/bin/bash

set -eu

home=$1
executable=$2

cat > $executable <<META_EOF
#!/bin/bash

set -eu

shell_script=\$1
commands_dir=\${shell_script%.sh}
home=${home}
command=\${commands_dir/\${home}\//}
commands=\$(ls -p \$commands_dir | grep -v /)
cat <<EOF

Available commands for '\${command//\// }':

\$(for c in \$commands; do
echo "  \${c%.sh}"
done)

EOF
META_EOF
