#!/bin/bash

#install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#install dependencies
brew install vim tmux cmake zsh

# keep os included vim (old version) and alias to the updated version
alias vim=/usr/local/bin/vim
