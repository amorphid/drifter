#!/bin/bash

set -eux

BOX=$1
BOX_HOME=${DRIFTER_BOXES}/${BOX}

mkdir -p ${BOX_HOME}

cp -pR ${DRIFTER_HOME} $BOX_HOME

cat > ${BOX_HOME}/Vagrantfile <<EOF
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/jessie64"

  config.vm.provision "shell", inline: <<-SHELL
    #!/bin/bash

    set -e -x

    /vagrant/drifter/bin/install.sh
    drifter box post_install ${BOX}
  SHELL
end
EOF
