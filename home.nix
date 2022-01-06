{ config, pkgs, lib, ... }:
let
  machine = import ./machine.nix;
  isNixOS = machine.operatingSystem == "NixOS";
  isMacOS = machine.operatingSystem == "Darwin";
in {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  # Home Manager needs a bit of information about you and the paths it should manage.
  home.username = "dannypsnl";
  home.homeDirectory = machine.homePath;
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";

  home.packages = with pkgs;
    (import ./pkgs.nix {
      pkgs = pkgs;
      isNixOS = isNixOS;
    }) ++ lib.optionals isNixOS (import ./nixos-pkgs.nix { pkgs = pkgs; })
    ++ lib.optionals isMacOS (import ./macos-pkgs.nix { pkgs = pkgs; });

  home.file.".agda/libraries".text = builtins.readFile ./agda/libraries;
  home.file.".agda/defaults".text = builtins.readFile ./agda/defaults;

  home.file.".config/kitty/kitty.conf".text = builtins.readFile ./kitty/kitty.conf;

  home.file.".config/nvim/coc-settings.json".text =
    builtins.readFile ./neovim/coc-settings.json;
  programs.neovim = (import ./neovim/config.nix) {
    pkgs = pkgs;
    lib = lib;
    isMacOS = isMacOS;
  };

  programs.zsh = (import ./zsh/config.nix) pkgs isMacOS;
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.direnv = if isMacOS then {
    enable = true;
    nix-direnv = {
      enable = true;
      enableFlakes = true;
    };
  } else {
    enable = true;
  };

  programs.git =
    (import ./git/config.nix) (machine.xnixPath + "/git/commit-template.txt");
}
