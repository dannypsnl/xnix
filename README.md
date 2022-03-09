# xnix

This project put my setting of \*nix environment.

## Installation

1. (Optional) Install Nix on non-NixOS

   ```zsh
   # non-nixos have to install nix first
   sh <(curl -L https://nixos.org/nix/install)
   ```

2. Install Home Manager

   ```zsh
   # install home manager
   nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
   nix-channel --update
   # non-nixos might need:
   export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
   nix-shell '<home-manager>' -A install
   ```

3. Get Repository

   ```zsh
   git clone https://github.com/dannypsnl/xnix.git
   cd xnix
   ```

4. Install Configuration

   ```zsh
   # generate current machine config
   echo "{ xnixPath = \"$(pwd)\"; operatingSystem = \"$(uname -v | awk '{ print $1 }' | sed 's/#.*-//')\"; homePath=\"$HOME\"; }" > machine.nix
   # install config to system
   ./install.sh
   ```

5. Apply

   ```zsh
   # apply config
   home-manager switch -b backup
   ```

## Reference

- [home manager options](https://nix-community.github.io/home-manager/options.html)
- [emacs: use-package](https://github.com/jwiegley/use-package)
