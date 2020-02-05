# nvim-set

Trying to using neovim instead of vim at future so start record plugin stack.

## Install Neovim (https://github.com/neovim/neovim/wiki/Installing-Neovim)

```bash
# macos
brew install neovim
# ubuntu
apt-get install -y neovim
# windows
choco install neovim
# nix
nix-env -iA nixpkgs.neovim
# openSUSE
sudo zypper in neovim
pip3 install neovim # python3 support for neovim
```

## Dependency

- gocode
    ```
    go get -u github.com/nsf/gocode
    ```
- ag: [github.com/ggreer/the_silver_searcher](https://github.com/ggreer/the_silver_searcher)
    ```
    # macos
    brew install the_silver_searcher
    # ubuntu
    apt-get install -y silversearcher-ag
    # openSUSE
    zypper install the_silver_searcher
    # windows
    choco install ag
    ```

## Supports

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
    - [vim-flog](https://github.com/rbong/vim-flog/)
    - [vim-gitgutter](https://vimawesome.com/plugin/vim-gitgutter): view git diff in real time
- Agda: reference to https://wiki.portal.chalmers.se/agda/uploads/Main.VIMEditing/agda-utf8 to know why we need this
- Language Server
    - `<C-b>`: go to defination
    - `<C-d>`: see defination
    - `<C-r>`: rename
    - `<C-a>`: list references

    Supports:
    - C/C++
    - Rust
    - Go
    - Haskell
- auto pair
- auto format
    - c/c++
    - protobuffer
    - go
    - rust
    - python
    - haskell
- Type Completion
    - Go
    - Rust
- Hightlight only
    - Pie
    - Peg(grammar syntax)
- Comment: Commentary type command `:10,17Commentary`, [Doc](https://vimawesome.com/plugin/commentary-vim)
- Ignore cap for `:wq`
- Clap: https://github.com/liuchengxu/vim-clap#commands
