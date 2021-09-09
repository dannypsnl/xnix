{ config, pkgs, lib, ... }:
let
  machine = import ./machine.nix;
  isNixOS = machine.operatingSystem == "NixOS";
  isMacOS = machine.operatingSystem == "Darwin";
  zig = import ./mypkgs/zig.nix pkgs;
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
    [
      # dev tools
      qemu
      tig
      cloc
      croc
      silver-searcher
      unzip
      curl
      wget
      ffmpeg
      graphviz
      youtube-dl # youtube downloader
      ## database
      postgresql
      ## static site generator
      nodePackages.gatsby-cli
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
      nasm
      gcc
      gdb
      gnumake
      cmake
      clang-tools
      ccls
      llvm_12
      gforth
      rustc cargo rls
      lua
      ## science
      python3
      ## erlang family
      rebar3 erlang
      elixir
      ## web
      nodePackages.pnpm
      purescript
      nodePackages.purescript-language-server
      nodePackages.purty
      nodejs nodePackages.prettier
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
    ] ++ lib.optionals isMacOS [
      # tool
      lima
      vagrant
      # language
      zig
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
