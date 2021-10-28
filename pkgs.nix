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
  croc
  silver-searcher
  unzip
  curl
  wget
  google-cloud-sdk
  ffmpeg
  graphviz
  youtube-dl
  gradle
  chez
  sbcl
  (agda.withPackages [ agdaPackages.standard-library ])
  idris2
  zig
  nasm
  lua
  binutils
  gnumake
  cmake
  clang-tools
  ccls
  gcc-unwrapped
  llvm
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
