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
alias kill='kill -9'
alias ps='ps aux'
alias psg='ps | grep'
alias dh='dh -h'
alias du='du -h'
alias dud='du -d'
alias upper="tr '[:lower:]' '[:upper:]'"

function dfu() {
    (
        cd ~/.dotfiles && git pullff && ./install -q
    )
}

# Turn off all proxies
function proxyoff()
{
        unset {http,https,ftp}_proxy
        unset {HTTP,HTTPS,FTP}_PROXY
        unset no_proxy
}

# Use pip without requiring virtualenv
function syspip() {
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# cd to git root directory
alias cdgr='cd "$(git root)"'

# Create a directory and cd into it
function mcd() {
    mkdir "${1}" && cd "${1}"
}

# Jump to directory containing file
function jump() {
    cd "$(dirname ${1})"
}

# cd replacement for screen to track cwd (like tmux)
function scr_cd()
{
    builtin cd $1
    screen -X chdir $PWD
}

if [[ -n $STY ]]; then
    alias cd=scr_cd
fi

# Go up [n] directories
function up()
{
    local cdir="$(pwd)"
    if [[ "${1}" == "" ]]; then
        cdir="$(dirname "${cdir}")"
    elif ! [[ "${1}" =~ ^[0-9]+$ ]]; then
        echo "Error: argument must be a number"
    elif ! [[ "${1}" -gt "0" ]]; then
        echo "Error: argument must be positive"
    else
        for i in {1..${1}}; do
            local ncdir="$(dirname "${cdir}")"
            if [[ "${cdir}" == "${ncdir}" ]]; then
                break
            else
                cdir="${ncdir}"
            fi
        done
    fi
    cd "${cdir}"
}

# Execute a command in a specific directory
function in() {
    (
        cd ${1} && shift && ${@}
    )
}

# Check if a file contains non-ascii characters
function nonascii() {
    LC_ALL=C grep -n '[^[:print:][:space:]]' ${1}
}

# Mirror a website
alias mirrorsite='wget -m -k -K -E -e robots=off'
