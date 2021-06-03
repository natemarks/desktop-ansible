#!/usr/bin/env bash
# /etc/bashrc.d/pyenv-pipenv.sh


# Add pyenv executable to PATH by adding
# the following to ~/.profile:

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:${PATH}"

# Load pyenv automatically by appending
# the following to ~/.bashrc:

eval "$(pyenv init -)"

# and the following to ~/.profile:

eval "$(pyenv init --path)"



# pipenv configuration
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'

# let's pipenv use pyenv automagically
export PIPENV_PYTHON="$PYENV_ROOT/shims/python"
