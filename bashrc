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
#source ~/.zsh/prompt.zsh

# Allow local customizations in the ~/.bashrc_local_after file
if [ -f ~/.bashrc_local_after ]; then
    source ~/.bashrc_local_after
fi


