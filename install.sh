#!/bin/sh

# kitty
ln -s $(pwd)/kitty/kitty.conf ${HOME}/.config/kitty/kitty.conf
# agda
ln -s $(pwd)/.agda/libraries ${HOME}/.agda/libraries
ln -s $(pwd)/.agda/defaults ${HOME}/.agda/defaults
# git
ln -s $(pwd)/git/config ${HOME}/.config/git/config
ln -s $(pwd)/git/ignore ${HOME}/.config/git/ignore
