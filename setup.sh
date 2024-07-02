#!/bin/bash
set -e

# Bash
if grep -q '/bash$' /etc/shells; then
    echo "Bash installed"
    stow bashrc
fi

# Zsh
if grep -q '/zsh$' /etc/shells; then
    echo "Zsh installed"
    stow zshrc
fi

# Tmux
if command -v tmux &>/dev/null; then
    echo "Tmux installed"
    stow tmux
fi

# Neovim
if command -v nvim &>/dev/null; then
    echo "Neovim installed"
    stow nvim
fi
