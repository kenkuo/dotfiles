#!/bin/bash
echo starting..
#install base dependencies
sudo apt-get install git yadm tmux vim

#yadm
yadm clone https://github.com/kenkuo/dotfiles.git
yadm decrypt
yadm remote set-url origin git@github.com:kenkuo/dotfiles.git

#tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#vim YouCompleteMe
sudo apt-get install build-essential cmake
sudo apt-get install python-dev python3-dev
(cd ~/.vim/plugged/YouCompleteMe && ./install.py)

#vim startify
mkdir -p ~/.vim/files.info

#set up vim
vim +PlugInstall +qall
