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
      youtube-dl
      postgresql
      nodePackages.gatsby-cli
      gradle
      chez
      sbcl
      (agda.withPackages [ agdaPackages.standard-library ])
      idris2
      nasm
      gnumake
      clang-tools
      ccls
      llvm_12
      rustc
      cargo
      rls
      rebar3
      erlang
      elixir
      ghc
      stack
      stylish-haskell
      ocaml
      opam
      ocamlPackages.merlin
      nodePackages.pnpm
      nodejs
      nodePackages.prettier
      go
      gopls
      python3
      nixfmt
      z3
    ] ++ lib.optionals isNixOS [
      racket
      gauche # gauche scheme
      isabelle
      factor-lang
      jdk
      tdesktop # telegram
    ] ++ lib.optionals isMacOS [ lima vagrant zig ];

  home.file.".agda/libraries".text = builtins.readFile ./agda/libraries;
  home.file.".agda/defaults".text = builtins.readFile ./agda/defaults;

  home.file.".emacs".text = builtins.readFile ./emacs/init.el;
  programs.emacs = import ./emacs/config.nix;

  home.file.".config/nvim/coc-settings.json".text =
    builtins.readFile ./neovim/coc-settings.json;
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

  programs.git =
    (import ./git/config.nix) (machine.xnixPath + "/git/commit-template.txt");
  programs.gh = {
    enable = true;
    editor = "nvim";
    gitProtocol = "ssh";
  };
}
