# xnix

This project put my setting of *nix environment.

## Installation

```zsh
# install configuration
./install

# install home manager
nix-channel --add https://github.com/nix-community/home-manager/archive/release-20.09.tar.gz home-manager
nix-channel --update
# non-nixos might need:
#export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
nix-shell '<home-manager>' -A install

home-manager switch
```

## Reference

- [home manager options](https://nix-community.github.io/home-manager/options.html)
- [emacs: use-package](https://github.com/jwiegley/use-package)

## Details

### Emacs

- racket-mode
- agda2-mode
- idris-mode
- nix-mode
- magit
  - cmd+k: magit-commit
  - cmd+shift+k: magit-push

### Neovim

- Load from last quit position
- Nerdtree: `<C-n>`
- Theme
    - solarized
    - [oldbook](https://github.com/KKPMW/oldbook-vim)
    - [distilled](https://github.com/KKPMW/distilled-vim)
- Status Bar: airline
- ctrlp: `<C-p>`
- :Ack `text you want to search in project`
- Git:
    - [fugitive](https://vimawesome.com/plugin/fugitive-vim)
    - [vim-gitgutter](https://vimawesome.com/plugin/vim-gitgutter): view git diff in real time
- auto pair
- auto format
    - c/c++
    - protobuffer
    - go
    - rust
- Type Completion
    - Go
    - Rust
- Comment: Commentary type command `:10,17Commentary`, [Doc](https://vimawesome.com/plugin/commentary-vim)
- Ignore cap for `:wq`
- Clap: https://github.com/liuchengxu/vim-clap#commands
- move cursor freely in the buffer: `set virtualedit=all`

### Git

#### Alias

-  co = "checkout"
-  br = "branch"
-  cm = "commit"
-  mg = "merge"
-  Pretty Tree: tree = "log --graph --decorate --pretty=oneline --abbrev-commit"
-  ad = "add"
-  df = "diff"
-  st = "status"
-  rb = "rebase"
