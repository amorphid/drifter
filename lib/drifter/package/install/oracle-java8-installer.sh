#!/bin/bash

set -eux

# instructions from http://www.webupd8.org/2014/03/how-to-install-oracle-java-8-in-debian.html

# add WebUpd8's Oracle Java Personal Package Archive
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list

# add WebUpd8's Oracle Java Source Personal Package Archive
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list

# add Ubuntu's signing key
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886

# resyncronize package index files
apt-get update -y

# set oracle installer to auto-accept
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

# install Oracle's Java 8
apt-get install -y oracle-java8-installer
