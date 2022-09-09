#!/bin/sh

# zsh
ln -s $(pwd)/macos-extra ${HOME}/.macos-extra
ln -s $(pwd)/zshrc ${HOME}/.zshrc

# neovim
mkdir -p ${HOME}/.config/nvim/lua/lspconfig/server_configurations
ln -s $(pwd)/vimrc ${HOME}/.config/nvim/init.vim
ln -s $(pwd)/lua/racket.lua ${HOME}/.config/nvim/lua/lspconfig/server_configurations/racket.lua

# kitty
ln -s $(pwd)/kitty/kitty.conf ${HOME}/.config/kitty/kitty.conf

# agda
ln -s $(pwd)/.agda/libraries ${HOME}/.agda/libraries
ln -s $(pwd)/.agda/defaults ${HOME}/.agda/defaults

# git
ln -s $(pwd)/git/config ${HOME}/.config/git/config
ln -s $(pwd)/git/ignore ${HOME}/.config/git/ignore
