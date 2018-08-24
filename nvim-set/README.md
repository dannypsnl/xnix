# nvim-set

Trying to using neovim instead of vim at future so start record plugin stack.

<blockquote class="imgur-embed-pub" lang="en" data-id="a/0ANlqLX"><a href="//imgur.com/0ANlqLX">my-neovim-snapshot</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>

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
- Ctags: `<F8>`
- Ignore cap for `:wq`
