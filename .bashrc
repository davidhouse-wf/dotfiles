echo '.bashrc'

# [ -n "$PS1" ] && source ~/.bash_profile

set -o vi
#export PS1='\u@\h \W$(__git_ps1 " (%s)")\$ '
#source ~/.bash_prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

export GREP_OPTIONS="--color=auto"
export CLICOLOR=1;

# BASH History config
shopt -s histappend
export HISTSIZE=20000
export HISTFILESIZE=100000
export HISTIGNORE="&:[ ]*:exit:ls:ls -la:cd:pwd:jobs"

# Auto-complete
#if [ -f ~/.config/bash_completion ]; then
    #. ~/.config/bash_completion
#fi

# git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_UNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
. $(brew --prefix)/share/git-core/../../etc/bash_completion.d/git-completion.bash
. $(brew --prefix)/share/git-core/../../etc/bash_completion.d/git-prompt.sh
#export PS1='\W$(__git_ps1 " (%s)")\$ '
#export PS1='\[\]\w\[\]$(__git_ps1 " (%s)")\[\0]\[\]$ \[\]'
PROMPT_COMMAND="__git_ps1 '\w' '\\$ '"

# Screen
export NETHACKOPTIONS="autoquiver,\!autopickup,name:Blue Meanie,fruit:papaya"
