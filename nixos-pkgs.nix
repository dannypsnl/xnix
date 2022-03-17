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
  caffeine-ng # prevent sleep
  kubectl
  kubernetes-helm
  kube3d
  xclip
]
