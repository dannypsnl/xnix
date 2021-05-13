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
      croc
      silver-searcher
      unzip
      curl
      wget
      ffmpeg
      graphviz
      vagrant
      youtube-dl # youtube downloader
      ## database
      postgresql
      ## static site generator
      mkdocs
      hugo
      ## build tool
      ant
      gradle
      # language
      ## lisp family
      chez # chez scheme
      #guile
      #gerbil
      sbcl # common-lisp
      leiningen # clojure
      ## prover
      #elan # lean
      coq
      (agda.withPackages [ agdaPackages.standard-library ])
      idris2
      ## system
      rustup
      gcc
      gdb
      gnumake
      cmake
      clang-tools
      ccls
      llvm_12
      gforth
      ## science
      julia
      python3
      ## erlang family
      erlang
      elixir
      ## web
      purescript
      nodePackages.purescript-language-server
      nodePackages.purty
      nodejs
      go
      gopls
      ## misc
      nixfmt
      z3
      # font
      iosevka
      iosevka-bin
    ] ++ lib.optionals isNixOS [
      racket
      gauche # gauche scheme
      isabelle
      factor-lang
      jdk
      tdesktop # telegram
    ];

  home.file.".agda/libraries".text = builtins.readFile ./agda/libraries;
  home.file.".agda/defaults".text = builtins.readFile ./agda/defaults;

  home.file.".emacs".text = builtins.readFile ./emacs/init.el;
  programs.emacs = import ./emacs/config.nix;

  home.file.".config/nvim/coc-settings.json".text = builtins.readFile ./neovim/coc-settings.json;
  programs.neovim = (import ./neovim/config.nix) pkgs lib isMacOS;

  programs.zsh = (import ./zsh/config.nix) pkgs isMacOS;
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.git = (import ./git/config.nix) (machine.xnixPath + "/git/commit-template.txt");
  programs.gh = {
    enable = true;
    editor = "nvim";
    gitProtocol = "ssh";
  };
}
