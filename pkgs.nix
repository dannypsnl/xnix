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
  (agda.withPackages [ agdaPackages.standard-library ])
  #zig
  binutils
  gnumake
  cmake
  clang-tools
  ccls
  doxygen
  rebar3
  erlang
  elixir
  nodejs
  nodePackages.pnpm
  nodePackages.prettier
  python3
  nixfmt
  z3
]
