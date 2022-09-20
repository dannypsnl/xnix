#!/bin/sh

# zsh
touch ${HOME}/.macos-extra
ln -s $(pwd)/zshrc ${HOME}/.zshrc

# neovim
ln -s $(pwd)/nvim ${HOME}/.config/nvim

# kitty
ln -s $(pwd)/kitty ${HOME}/.config/kitty

# git
ln -s $(pwd)/git ${HOME}/.config/git
