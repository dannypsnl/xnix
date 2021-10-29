{ pkgs, ... }:
with pkgs; [
  racket
  gauche # gauche scheme
  gcc
  factor-lang
  jdk
  tdesktop # telegram
  slack
  kubectl
  kubernetes-helm
  kube3d
  transcrypt
]
