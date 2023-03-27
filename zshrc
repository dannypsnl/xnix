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

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
export PATH=/opt/homebrew/bin:$PATH
export HOMEBREW_NO_ANALYTICS=1


[ -f "${HOME}/.cargo/env" ] && source "${HOME}/.cargo/env" # cargo-env
[ -f "${HOME}/.ghcup/env" ] && source "${HOME}/.ghcup/env" # ghcup-env
# opam setup
[ -f "${HOME}/.opam/opam-init/init.zsh" ] && source "${HOME}/.opam/opam-init/init.zsh" > /dev/null 2> /dev/null
[ -f "${HOME}/.opam/opam-init/init.zsh" ] && eval $(opam env)
[[ -s "$HOME/.xmake/profile" ]] && source "$HOME/.xmake/profile" # xmake setup
eval "$(direnv hook zsh)"

# PATH
export PATH=/Applications/Racket\ v8.8/bin/:$PATH
export PATH="/opt/homebrew/opt/riscv-gnu-toolchain/bin:$PATH"
export PATH=${HOME}/.cabal/bin:$PATH
export PATH=${HOME}/.local/bin:$PATH
export PATH=/Applications/Racket\ v8.8/bin:$PATH

# LLVM
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# Java
export JAVA_HOME=$(/usr/libexec/java_home)
export JAVA_INCLUDE_PATH="${JAVA_HOME}/include"

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
alias diff="kitty +kitten diff"
alias ssh="kitty +kitten ssh"
