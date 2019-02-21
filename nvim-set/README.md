# nvim-set

Trying to using neovim instead of vim at future so start record plugin stack.

## Install

```bash
$ make install
```

## Install Neovim

- MacOS
    ```bash
    $ brew install neovim
    $ pip3 install neovim # python3 support for neovim
    ```

## Dependency

- gocode
    ```
    go get -u github.com/nsf/gocode
    ```
- ag: [github.com/ggreer/the_silver_searcher](https://github.com/ggreer/the_silver_searcher)
    ```
    brew install the_silver_searcher
    ```

## Supports

- Load from last quit position
- Nerdtree: `<C-n>`
- Theme: solarized
- Status Bar: airline
- ctrlp: `<C-p>`
- :Ack `text you want to search in project`
- Git:
    - [fugitive](https://vimawesome.com/plugin/fugitive-vim)
    - [vim-gitgutter](https://vimawesome.com/plugin/vim-gitgutter): view git diff in real time
- Language Server
    - `<C-b>`: go to defination
    - `<C-d>`: see defination
    - `<C-r>`: rename
    - `<C-a>`: list references

    Supports:
    - C/C++
    - Rust
    - Go
- auto pair
- auto format
    - c/c++
    - protobuffer
    - go
    - rust
    - python
- Type Completion
    - Go
    - Rust
- Hightlight only
    - Peg(grammar syntax)
- Ctags: auto open
- Comment: Commentary type command `10,17Commentary`, [Doc](https://vimawesome.com/plugin/commentary-vim)
- Ignore cap for `:wq`
