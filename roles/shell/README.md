#  Shell Config
This will be a  basic , flexible shell config supporting bash. 

1) Create a system-wide plugin directory, and a user home plugin directory.
2) $HOME/.bashrc.local sources all files in $HOME/bashrc.d
3) Some files in $HOME/bashrc.d are links to the system wid plugin scripts in /etc/bashrc.d


I like to use the plugin directory approach because it's easier to manage than editing sections into a shared file - especially with automation.

### create (644) $HOME/.bashrc.local
```shell
# $HOME/.bashrc.local
if [ -d $HOME/bashrc.d ]; then
  for i in $HOME/bashrc.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi
   
   ```
### append bashrc.local source to $HOME/.bashrc
```shell
# $HOME/.bashrc
source $HOME/.bashrc.local

```
### create bash shell plugin directory
```shell
mkdir $HOME/bashrc.d/
```

### create the system shell plugin directory
```shell
sudo mkdir /etc/bashrc.d/
```

### create system script for pyenv
```shell
# /etc/bashrc.d/pyenv-pipenv.sh


# Add pyenv executable to PATH by adding
# the following to ~/.profile:

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

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

```

### link home pyenv plugin to system
```shell
ln -s /etc/bashrc.d/pyenv-pipenv.sh $HOME/bashrc.d/pyenv-pipenv.sh
```


### Create a system script for go
```shell
export PATH=/opt/golang/current/go/bin:$PATH
export PATH=$HOME/go/bin:$PATH
export GO111MODULE=on
export GOPATH=$HOME/go
```
### link the home go plugin to system
```shell
ln -s /etc/bashrc.d//golang.sh $HOME/bashrc.d/golang.sh
```

### create some personal plugins
```shell
# $HOME/bashrc.d/add_home_bin_path.sh 
export PATH="$HOME/bin:$PATH"
```


```shell
# $HOME/bashrc.d/aliases.sh
alias find_pytest_files='find /private -name "*pytest*" -print 2>&1 | grep -v "Operation not permitted" | grep -v "Permission denied"'
# reverts the local copy of the branch to match the upstream
alias git_rollback_to_remote='git reset --hard @{u}'
alias tfp='terraform init && terraform plan'
alias tfa='terraform init && terraform plan && terraform apply'
alias tgp='terragrunt init && terragrunt plan'
alias tga='terragrunt init && terragrunt plan && terragrunt apply'
alias git_diff='git diff --word-diff=color --word-diff-regex=. $1 $2'
alias do_prune_everything='docker system prune -a'
alias git_rm_ignored='git rm -r --cached . && git add . && git commit -m "purged files based on new .gitignore fix"'

alias idea_proj='code -n $(find $HOME/PycharmProjects $HOME/go/src/github.com/natemarks $HOME/Projects -maxdepth 1 -type d 2>/dev/null | fzf)' 
alias vsc_file='code -n $(find . -type f 2>/dev/null  | fzf)'
alias idea_proj='idea $(find $HOME/PycharmProjects $HOME/go/src/github.com/natemarks $HOME/Projects -maxdepth 1 -type d 2>/dev/null | fzf)' 
alias idea_file='idea $(find . -type f 2>/dev/null  | fzf)'
alias gedit_file='gedit $(find . -type f 2>/dev/null  | fzf)'

alias cd_temp='cd $(mktemp -d -t deleteme.XXXXXX)'
# leaving command as ls until  I get confident in this one
alias tmp_clean='sudo find -L /tmp /var -type d -name "deleteme*" -print 2> /dev/null | xargs ls'
alias cdp='cd $(find ~/Projects ~/PycharmProjects ~/go/src/github.com/natemarks $HOME/PycharmProjects -maxdepth 1 -type d | fzf)'
alias add_ssh_key='ssh-add $HOME/.ssh/nmarks_imprivata'
alias cd_proj='cd $(find $HOME/Projects -type d -maxdepth 1| fzf)'
alias cd_go_proj='cd $(find $HOME/go/src/github.com/natemarks -type d -maxdepth 1| fzf)'
alias add_ssh_key='ssh-add $HOME/.ssh/nmarks_imprivata'
alias cd_proj='cd $(find $HOME/Projects -type d -maxdepth 1| fzf)'
alias cd_go_proj='cd $(find $HOME/go/src/github.com/natemarks -type d -maxdepth 1| fzf)'

```
