# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
plugins=(
  git
  mercurial
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

fpath+=~/.zfunc

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
[ -f "${HOME}/.elan/env" ] &&source $HOME/.elan/env        # elan-env
# opam setup
[ -f "${HOME}/.opam/opam-init/init.zsh" ] && source "${HOME}/.opam/opam-init/init.zsh" > /dev/null 2> /dev/null
[ -f "${HOME}/.opam/opam-init/init.zsh" ] && eval $(opam env)
[[ -s "$HOME/.xmake/profile" ]] && source "$HOME/.xmake/profile" # xmake setup
eval "$(direnv hook zsh)"

# PATH
export PATH=/opt/homebrew/opt/dotnet@6/bin:$PATH
export PATH=${HOME}/.cabal/bin:$PATH
export PATH=${HOME}/.local/bin:$PATH
export PATH=${HOME}/.elan/bin:$PATH
export PATH=/Applications/Racket\ v8.10/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH="$WASMTIME_HOME/bin:$PATH"

# LLVM
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# Java
export JAVA_HOME=$(/usr/libexec/java_home)
export JAVA_INCLUDE_PATH="${JAVA_HOME}/include"

export WASMTIME_HOME="$HOME/.wasmtime"

if [[ `uname` == "Darwin" ]]; then
else
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
fi

# Aliases
alias h='hg'
alias la='ll -a'
alias lam='la | more'
alias ll='ls -l'
alias lm='ll | more'
alias ls='ls -GFh'
alias vi='nvim'
alias vim='nvim'
alias diff="kitty +kitten diff"
alias ssh="kitty +kitten ssh"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)$(hg_prompt_info)%{$fg_bold[blue]%}% %{$reset_color%}'

ZSH_THEME_HG_PROMPT_PREFIX="%{$fg_bold[blue]%}hg:(%{$fg[red]%}"
ZSH_THEME_HG_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_HG_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗ %{$reset_color%}"
ZSH_THEME_HG_PROMPT_CLEAN="%{$fg[blue]%}) "
