{ pkgs, isMacOS, lib, ... }:
let customPlugins = (import ./custom-plugins.nix) { pkgs = pkgs; };
in with pkgs.vimPlugins // customPlugins;
[
  nerdtree
  # theme
  solarized
  oldbook-vim
  distilled-vim
  nord-vim
  # tools
  ack-vim
  ctrlp
  coc-nvim
  airline
  vim-fugitive
  vim-gitgutter
  vim-commentary
  auto-pairs
  fzf-vim
  julia-vim
  zig-vim
  nix-vim
  vim-stylish-haskell
  wakatime
] ++ lib.optionals isMacOS [ idris2-vim ]
