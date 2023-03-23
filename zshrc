plugins=(
  git
  fzf
  dotenv
  macos
  mix
  npm
  vagrant
)

ZSH_THEME="robbyrussell"
source ${HOME}/.oh-my-zsh/oh-my-zsh.sh

# History options should be set in .zshrc and after oh-my-zsh sourcing.
# See https://github.com/nix-community/home-manager/issues/177.
HISTSIZE="100000"
SAVEHIST="100000"

HISTFILE="$HOME/.zsh_history"
mkdir -p "$(dirname "$HISTFILE")"

setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
unsetopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
unsetopt EXTENDED_HISTORY

export PATH=/opt/homebrew/bin:$PATH

source "$HOME/.cargo/env"
eval "$(direnv hook zsh)"

if [[ `uname` == "Darwin" ]]; then
else
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
fi

# Aliases
alias la='ll -a'
alias lam='la | more'
alias ll='ls -l'
alias lm='ll | more'
alias ls='ls -GFh'
alias vi='nvim'
alias vim='nvim'
