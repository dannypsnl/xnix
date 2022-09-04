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

  home.packages = with pkgs;
    (import ./pkgs.nix {
      pkgs = pkgs;
      isNixOS = isNixOS;
    })
    ++ lib.optionals isMacOS (import ./macos-pkgs.nix { pkgs = pkgs; });

  programs.zsh = (import ./zsh/config.nix) pkgs isMacOS;
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.direnv = if isMacOS then {
    enable = true;
    nix-direnv = {
      enable = true;
    };
  } else {
    enable = true;
  };
}
