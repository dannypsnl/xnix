{ pkgs, ... }:
with pkgs; [
  kitty
  racket
  gauche # gauche scheme
  gcc
  llvm
  factor-lang
  jdk
  tdesktop # telegram
  slack
  kubectl
  kubernetes-helm
  kube3d
  transcrypt
  xclip
]
