echo "config bashrc"

# allow local customizations in the ~/.bashrc_local_before file
if [ -f ~/.bashrc_local_before ]; then
    source ~/.bashrc_local_before
fi

# settings
#source ~/.zsh/settings.zsh

# bootstrap
#source ~/.zsh/bootstrap.zsh

# aliases (share the same aliases with zsh)
source ~/.zsh/aliases.zsh

# Custom prompt
# Format the prompt
#function EXT_COLOR () { echo -ne "\[\033[38;5;$1m\]";COL_COLOR="\[\033[0m\]"; }
#PS1='\[\e[1;32m\][\u@\h \w]\$\[\e[0m\] '
# moved to bashrc_local_after

# Allow local customizations in the ~/.bashrc_local_after file
if [ -f ~/.bashrc_local_after ]; then
    source ~/.bashrc_local_after
fi


