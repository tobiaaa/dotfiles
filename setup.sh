#!/bin/bash

# Stow
stow -d . -t $HOME --simulate -v

# zsh config



# tmux config
mkdir ~/.tmux;
# Install tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf;

# vim config
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln -s ~/.dotfiles/.vimrc ~/.vimrc;
