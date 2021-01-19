# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# general ENV Setting
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=true
export LSCOLORS=ExFxBxDxCxegedabagacad
export LIBRARY_PATH=/usr/local/lib:$LIBRARY_PATH

nix_profile=$HOME/.nix-profile/etc/profile.d/nix.sh
[ -f $nix_profile ] && source $nix_profile

source ~/.company.env

plugins=(
  git
  dotenv
  osx
  k
)

source ~/.local.sh
source $HOME/.elan/env

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# General commands
alias ls='ls -GFh'
alias ll='ls -l'
alias la='ll -a'
alias lm='ll | more'
alias lam='la | more'
alias vim='nvim'
alias vi='nvim'
alias g='git'

eval "$(direnv hook zsh)"
