#!/bin/bash

set -eux

# instructions from http://elixir-lang.org/install.html#unix-and-unix-like

# download Erlang Solution's debian repo
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb

# install Erlang Solution's debian repo
dpkg -i erlang-solutions_1.0_all.deb

# update package list
apt-get update -y

# install erlang
apt-get install -y esl-erlang

# install elixir
apt-get install -y elixir
