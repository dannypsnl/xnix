{ config, pkgs, lib, ... }:
let
  machine = import ./machine.nix;
  isNix = machine.operatingSystem == "NixOS";
  isMacOS = machine.operatingSystem == "Darwin";
in {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  # Home Manager needs a bit of information about you and the paths it should manage.
  home.username = "dannypsnl";
  home.homeDirectory =
    if isMacOS then "/Users/dannypsnl" else "/home/dannypsnl";
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
    [
      # dev tools
      tig
      cloc
      silver-searcher
      ant
      vagrant
      unzip
      curl
      wget
      # language
      chez
      elan
      sbcl
      coq
      (agda.withPackages [ agdaPackages.standard-library ])
      idris2
      rustup
      gcc
      gdb
      gnumake
      cmake
      clang-tools
      llvm
      erlang
      elixir
      ocaml
      opam
      nodejs
      go
      python3
      nixfmt
      z3
      # youtube downloader
      youtube-dl
    ] ++ lib.optional isNix [
      racket
      isabelle
      idris
      jdk14
      tdesktop # telegram
    ];

  home.file.".emacs".text = builtins.readFile ./config.el;
  programs.emacs = import ./emacs.nix;
  programs.neovim = (import ./neovim.nix) pkgs;

  programs.zsh = (import ./zsh.nix) pkgs isMacOS;
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.git = (import ./git.nix) (machine.xnixPath + "/commit-template.txt");
  programs.gh = {
    enable = true;
    editor = "nvim";
    gitProtocol = "ssh";
  };
}
