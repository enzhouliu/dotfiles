#!/bin/bash

#install brew
if where brew > /dev/null 2>&1; then
    echo "Installling brew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew upgrade

#install dependencies
brew install \
    vim \
    tmux \
    cmake \
    zsh \
    htop \
    grip

# keep os included vim (old version) and alias to the updated version
#alias vim=/usr/local/bin/vim
