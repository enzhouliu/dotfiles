if [[ $(uname) == "Darwin" ]]; then
    alias ls='ls -G'
    alias ll='ls -alt'
else
    alias ls='ls --color=auto'
    alias ll='ls -alt --color=auto'
fi

# aliases
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias mkdir='mkdir -p'
alias ssh='TERM=xterm ssh'
alias vi='vim'
alias g='git'
alias fn='find . -name'
alias killp='kill -9'
alias ps='ps aux'
alias psg='ps | grep'
alias dh='dh -h'
alias du='du -h'
alias dud='du -d'
alias upper="tr '[:lower:]' '[:upper:]'"
