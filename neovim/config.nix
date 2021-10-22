{ pkgs, lib, isMacOS, ... }:
let
  plugins = (import ./plugins.nix) {
    pkgs = pkgs;
    lib = lib;
    isMacOS = isMacOS;
  };
  config = builtins.readFile ./vimrc;
in if isMacOS then {
  enable = true;
  plugins = plugins;
  extraConfig = config;
} else {
  enable = true;
  plugins = plugins;
  withPython = false;
  extraConfig = config;
}
