#!/bin/sh

# zsh config

# tmux config
mkdir ~/.tmux;
# Install tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf;

# vim config
ln -s ~/.dotfiles/.vimrc ~/.vimrc;
