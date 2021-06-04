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
alias add_ssh_key='ssh-add -K ~/.ssh/my_private_key'

alias idea_proj='code -n $(find $HOME/PycharmProjects $HOME/go/src/github.com/natemarks $HOME/Projects -maxdepth 1 -type d 2>/dev/null | fzf)'
alias vsc_file='code -n $(find . -type f 2>/dev/null  | fzf)'
alias idea_proj='idea $(find $HOME/PycharmProjects $HOME/go/src/github.com/natemarks $HOME/Projects -maxdepth 1 -type d 2>/dev/null | fzf)'
alias idea_file='idea $(find . -type f 2>/dev/null  | fzf)'
alias gedit_file='gedit $(find . -type f 2>/dev/null  | fzf)'

alias cd_temp='cd $(mktemp -d -t deleteme.XXXXXX)'
# leaving command as ls until  I get confident in this one
alias tmp_clean='sudo find -L /tmp /var -type d -name "deleteme*" -print 2> /dev/null | xargs ls'
alias cdp='cd $(find ~/Projects ~/PycharmProjects ~/go/src/github.com/natemarks $HOME/PycharmProjects -maxdepth 1 -type d | fzf)'
nate@nate-Z170XP-SLI:~$ cat ~/bashrc.d/private_aliases.sh
alias add_ssh_key='ssh-add $HOME/.ssh/nmarks_imprivata'
alias cd_proj='cd $(find $HOME/Projects -type d -maxdepth 1| fzf)'
alias cd_go_proj='cd $(find $HOME/go/src/github.com/natemarks -type d -maxdepth 1| fzf)'
