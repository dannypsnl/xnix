# xnix

This project put my setting of \*nix environment.

## Installation

```zsh
# non-nixos have to install nix first
curl https://nixos.org/nix/install | sh

# install home manager
nix-channel --add https://github.com/nix-community/home-manager/archive/release-20.09.tar.gz home-manager
nix-channel --update
# non-nixos might need:
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
nix-shell '<home-manager>' -A install

# get this repo
git clone https://github.com/dannypsnl/xnix.git
cd xnix
# generate current machine config
echo "{ xnixPath = \"$(pwd)\"; operatingSystem = \"$(uname -v | awk '{ print $1 }' | sed 's/#.*-//')\"; homePath=\"$HOME\"; }" > machine.nix
# install config to system
ln -s $(pwd)/home.nix ${HOME}/.config/nixpkgs/home.nix
# (optional) on non-NixOS you can do the following to install pkg config to system
ln -s $(pwd)/config.nix ${HOME}/.config/nixpkgs/config.nix

# apply config
home-manager switch
```

## Reference

- [home manager options](https://nix-community.github.io/home-manager/options.html)
- [emacs: use-package](https://github.com/jwiegley/use-package)
