{ config, pkgs, lib, ... }:
let
  machine = import ./machine.nix;
  isNixOS = machine.operatingSystem == "NixOS";
  isMacOS = machine.operatingSystem == "Darwin";
in {
  programs.home-manager.enable = true;
  home.username = "dannypsnl";
  home.homeDirectory = machine.homePath;
  home.stateVersion = "21.03";

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
