
source /usr/local/bin/git-prompt.sh
export PS1="\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\[\033[0;31m\]\$(__git_ps1 ' [%s]')\[\033[0m\]\n\$ "

