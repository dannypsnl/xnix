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
