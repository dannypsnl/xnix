{ pkgs, ... }:
with pkgs; [
  vagrant
  stack
  ghc
  haskell-language-server
  stylish-haskell
  gtk3
  nodePackages.gatsby-cli
]
