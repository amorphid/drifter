#!/bin/bash

set -e -x

BOX=$1
BOX_HOME=${DRIFTER_BOXES}/${BOX}

mkdir -p ${BOX_HOME}

cp -pR ${DRIFTER_HOME} $BOX_HOME

cat > ${BOX_HOME}/Vagrantfile <<EOF
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/jessie64"

  # create 15 character hostname
  config.vm.hostname = "jessie-$(drifter-hostname)"[0..14]

  # provision script runs only once (on VM initial boot)
  config.vm.provision "shell", inline: <<-SHELL
    #!/bin/bash

    set -e -x

    # install Drifter
    /vagrant/drifter/bin/install.sh

    # run post install script
    drifter box post_install ${BOX}
  SHELL
end
EOF
