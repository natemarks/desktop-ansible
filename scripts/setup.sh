#!/usr/bin/env bash
#
# Setup Ansible and run the anyconnect role
#

if [[ -z "$BASH" ]]; then
  echo "error: the environment only supports a bash shell"
  exit 1
fi

set -o pipefail
set -e

# declare -r anyconnect_installer="${HOME}/anyconnect-linux64-4.9.06037-predeploy-k9.tar.gz"



# Clone the desktop-ansible project to $HOME
sudo apt install -y git
git clone https://github.com/natemarks/desktop-ansible.git "${HOME}/desktop-ansible"

# install python3 and ansible
sudo apt install -y python3 python3-pip
sudo pip3 install ansible
# export PATH="$HOME/.local/bin:${PATH}"


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

cd "$HOME/desktop-ansible"
ansible-playbook anyconnect_playbook.yml
#
#git clone https://github.com/pyenv/pyenv.git "${HOME}/.pyenv"
#
#
#sudo mkdir /etc/bashrc.d
#sudo curl https://raw.githubusercontent.com/natemarks/desktop-ansible/main/roles/shell/templates/pyenv-pipenv.sh > \
#/etc/bashrc/pyenv-pipenv.sh
#sudo chmod 644:644 /etc/bashrc/pyenv-pipenv.sh
#. /etc/bashrc/pyenv-pipenv.sh
#
#export PATH="$HOME/.local/bin:${PATH}"
#
#pyenv install 3.9.2
#pip install --user -upgrade pip setuptools
