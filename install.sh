#!/bin/bash

# install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
# install brew
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install neovim emacs direnv opam
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# install ghcup
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
# install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# install xmake
curl -fsSL https://xmake.io/shget.text | bash

# config
mkdir -p ${HOME}/.config
# zsh
ln -s $(pwd)/zshrc ${HOME}/.zshrc
# neovim
ln -s $(pwd)/nvim ${HOME}/.config/nvim
# kitty
ln -s $(pwd)/kitty ${HOME}/.config/kitty
# git
ln -s $(pwd)/git ${HOME}/.config/git
