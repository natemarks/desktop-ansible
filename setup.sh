#!/usr/bin/env bash

# required to get the desktop-ansible projecy
sudo apt install -y \
git

# required to permit pyenv to install python versions
sudo apt install -y \
build-essential \
libssl-dev \
zlib1g-dev \
libbz2-dev \
libreadline-dev \
libsqlite3-dev \
wget \
curl \
llvm \
libncurses5-dev \
xz-utils \
tk-dev


git clone https://github.com/pyenv/pyenv.git "${HOME}/.pyenv"


sudo mkdir /etc/bashrc.d
sudo curl https://raw.githubusercontent.com/natemarks/desktop-ansible/main/roles/shell/templates/pyenv-pipenv.sh > \
/etc/bashrc/pyenv-pipenv.sh
sudo chmod 644:644 /etc/bashrc/pyenv-pipenv.sh
. /etc/bashrc/pyenv-pipenv.sh

export PATH="$HOME/.local/bin:${PATH}"

pyenv install 3.9.2
pip install --user -upgrade pip setuptools
