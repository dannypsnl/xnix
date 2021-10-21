{ pkgs, ... }:
with pkgs; [
  racket
  gauche # gauche scheme
  isabelle
  factor-lang
  jdk
  tdesktop # telegram
  slack
  kubectl
  kubernetes-helm
  kube3d
  transcrypt
  riak
]
