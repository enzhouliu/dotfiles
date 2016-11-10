#!/usr/bin/env bash
echo "source .bashrc"

unset file

# Format the prompt
function EXT_COLOR () { echo -ne "\[\033[38;5;$1m\]";COL_COLOR="\[\033[0m\]"; }
PS1='\[\e[1;32m\][\u@\h \w]\$\[\e[0m\] '

# setup editor and color scheme
export EDITOR=vim
export TERM=xterm-256color
#if [ "$TERM" != "screen-256color" ]; then
    #export TERM=xterm-256color
#fi

## keep up to 32^3 lines of history
export HISTFILESIZE=32768
export HISTSIZE="$HISTFILESIZE"

## ignore commands that:
##   * begin with a space character
##   * that is the same as the previous
## and remove duplicate commands
export HISTCONTROL=ignoreboth:erasedups
## ignore these commands in history
export HISTIGNORE="ls:cd:cd -:[bf]g:pwd:exit:clear:* --help:* -h"

## always append history to history file after each command
export PROMPT_COMMAND='history -a'

#cd to devgit + subdirectory 
function cg(){
    SCRP_DEVGIT_PATH="/home/sli474/mbig/devgit/"
    cd $SCRP_DEVGIT_PATH$1
}

#cd to devgit + subdirectory 
function cm(){
    SCRP_MBIG_PATH="/home/sli474/mbig/"
    cd $SCRP_MBIG_PATH$1
}

#cd to log + subdirectory 
function log(){
    SCRP_MBIG_PATH="/scrp/data/"
    cd $SCRP_MBIG_PATH$1"/log"
}

function logview
{
    if (( $# == 3 ))
    then
        ls -rt $1/$2.log* | tail -$3 | head -1
    elif (( $# == 2 ))
    then
        \less -n -S $(ls -rt $1/$2.log* | tail -1)
    else
        \tail -f  $(ls -rt /scrp/data/$1/log/$1.log* | tail -1)
    fi
}


alias ls='ls --color=auto'
alias ll='ls -lht --color=auto'
alias rm='rm -i'
alias cp='cp -i'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias mkdir='mkdir -p'
alias pw="/bb/bin/getprdwin"

alias ssh='TERM=xterm ssh'
alias tmux='/opt/bb/bin/tmux'
alias vi='vim'
alias mvn='/opt/swt/install/apache-maven-3.1.1/bin/mvn'
alias spark-submit='/home/sli474/mbig/devgit/spark/spark-1.3.1-bin-hadoop2.6/bin/spark-submit'
alias spark-shell='/home/sli474/mbig/devgit/spark/spark-1.3.1-bin-hadoop2.6/bin/spark-shell'
alias pyspark='/home/sli474/mbig/devgit/spark/spark-1.3.1-bin-hadoop2.6/bin/pyspark'
alias python2='/opt/bb/bin/python'
alias g='git'
## Mining team alias
. /bb/unsupported/scrputil/team_profile/scrpenv.sh
export PATH=/opt/bb/bin/clang:$PATH
export PATH=/opt/bb/bin/clang-format:$PATH
export PATH=/opt/bb/bin/:$PATH
export PATH="/home/sli474/bin/":$PATH
export JAVA_HOME=/bb/bin/j2sdk1.8-oracle
#alias git='vastool kinit && git'
alias gmake='vastool kinit -R && gmake'

SYS_ARCH=$(uname)
if [[ ${SYS_ARCH} == "Linux" ]];then
    echo "sourced .bash_prompt.sh"
    source $HOME/.bash_prompt.sh
fi
