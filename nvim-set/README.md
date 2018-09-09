# nvim-set

Trying to using neovim instead of vim at future so start record plugin stack.

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
- auto pair
- auto format
    - c/c++
    - protobuffer
    - go
    - rust
- Type Completion
    - Go
	- Rust
- Ctags: `<F8>`
- Ignore cap for `:wq`
