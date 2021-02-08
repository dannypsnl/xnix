# xnix

This project put my setting of *nix environment.

## Installation

```zsh
./install
```

## Reference

- [home manager options](https://nix-community.github.io/home-manager/options.html)

## Details

### Emacs

- `<space>-c-i/o/r` for start/end/report time
- `<space>-w-v` open new window at right
- `<space>-w-<up>/<down>/<right>/<left>` moving between windows

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

-  Checkout
    `$ git co <branch>`
-  Branch
    `$ git br <--params>`
-  Commit
    `$ git cm <--params>`
-  Merge
    `$ git mg <branch>`
-  Pretty Tree
    `$ git tree`
-  Add
    `$ git ad <--path, files>`
-  Diff
    `$ git df <commit-log>`
-  Status
    `$ git st`
-  Rebase
    `$ git rb`

#### setup global ignore file

```
git config --global core.excludesfile ~/.gitignore_global
```
