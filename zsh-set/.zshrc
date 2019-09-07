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
export PATH=$PATH:$HOME/.cabal/bin
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH=$PATH:$HOME/node_modules/.bin
export PATH="$HOME/.local/bin:$PATH"

source /Users/dannypsnl/.nix-profile/etc/profile.d/nix.sh

export PATH="$HOME/workspace/tool/flutter/bin:$PATH"
export PATH="$HOME/opt/GNAT/2019/bin:$PATH"

export PATH="/opt/gps/bin:$PATH"
source ~/.company.env

plugins=(
  git
  bundler
  dotenv
  osx
  rake
  ruby
  rbenv
  kubectl
)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# added by travis gem
[ -f /Users/dannypsnl/.travis/travis.sh ] && source /Users/dannypsnl/.travis/travis.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/dannypsnl/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/dannypsnl/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/dannypsnl/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/dannypsnl/google-cloud-sdk/completion.zsh.inc'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /Users/dannypsnl/code/go/src/github.com/dannypsnl/on/on-completion.sh

export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH=$HOME/.cache/rebar3/bin:$PATH
export PATH=$HOME/.cache/bin:$PATH
export PATH="/usr/local/opt/qt/bin:$PATH"
export BXSHARE="/opt/bochs/share/bochs"
export PATH=$PATH:/opt/bochs/bin

eval "$(direnv hook zsh)"
