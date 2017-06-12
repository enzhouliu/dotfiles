
# Nicer history
HISTSIZE=1048576
HISTFILE="$HOME/.bash_history"
SAVEHIST=$HISTSIZE

export HISTCONTROL=ignoreboth:erasedups
## ignore these commands in history
export HISTIGNORE="ls:cd:cd -:[bf]g:pwd:exit:clear:* --help:* -h"
## always append history to history file after each command
export PROMPT_COMMAND='history -a'

export EDITOR=vim
export TERM=xterm-256color

# bash completion
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    elif [ -f /etc/bash_completion.d/git ]; then
        . /etc/bash_completion.d/git
    elif [ -f /usr/local/etc/bash_completion ]; then
        . /usr/local/etc/bash_completion
    fi
fi

# to help with autocompletion for g
if [[ -n $(type -t _completion_loader) ]]; then
    _completion_loader git
fi

if [[ -n $(type -t __git_complete) ]]; then
    __git_complete g _git
fi

# in case bash completion is not installed on ibm machiens
git_branch_info() {
    git_prompt_text="$(git symbolic-ref HEAD 2>/dev/null | cut -d'/' -f3)" || ""
    if [[ -n $git_prompt_text ]]; then
        echo " <$git_prompt_text>"
    else
        echo ""
    fi
}

# promptline setup
if [[ $(uname) == "AIX" ]]; then
    PS1='\[\e]0;\u@\h:\w\a\]\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[36m\]\W\[\033[33m\]$(git_branch_info " <%s>")\[\033[00m\] $ '
else
    PS1='\[\e]0;\u@\h:\w\a\]\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[36m\]\W\[\033[33m\]$(__git_ps1 " <%s>")\[\033[00m\] $ '
fi

# set up fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash


