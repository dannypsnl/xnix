{ pkgs, isNixOS, ... }:
let
  zig = (import ./mypkgs/zig.nix) {
    pkgs = pkgs;
    isNixOS = isNixOS;
  };
in with pkgs; [
  gh
  tig
  cloc
  tree
  croc
  silver-searcher
  unzip
  curl
  wget
  ffmpeg
  graphviz
  youtube-dl
  gradle
  chez
  sbcl
  (agda.withPackages [ agdaPackages.standard-library ])
  binutils
  gnumake
  cmake
  clang-tools
  ccls
  doxygen
  rustc
  cargo
  rls
  rebar3
  erlang
  elixir
  nodejs
  nodePackages.pnpm
  nodePackages.prettier
  go
  gopls
  python3
  nixfmt
  z3
]
