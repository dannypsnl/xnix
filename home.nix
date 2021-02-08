{ config, pkgs, lib, ... }:
let
  machine = import ./machine.nix;
  isNix = machine.operatingSystem == "NixOS";
  isMacOS = machine.operatingSystem == "Darwin";
in
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "dannypsnl";
  home.homeDirectory = if isMacOS then "/Users/dannypsnl" else "/home/dannypsnl";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";

  home.packages = with pkgs; [
    # dev tools
    tig
    silver-searcher
    ant
    vagrant
    cloc
    # language
    chez
    elan
    coq
    (agda.withPackages [ agdaPackages.standard-library ])
    idris2
    rustup
    gcc gdb gnumake cmake clang-tools llvm
    erlang elixir
    nodejs
    go
    python3
    # nice tools
    youtube-dl # youtube downloader
    unzip
    wget
  ] ++ lib.optional isNix
  [ racket isabelle idris jdk14
    tdesktop # telegram
  ];

  home.file.".emacs".text = builtins.readFile ./init.el;
  programs.emacs = import ./emacs.nix;
  programs.neovim = (import ./neovim.nix) pkgs;

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = (import ./zsh.nix) pkgs isMacOS;

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.gh = {
    enable = true;
    editor = "nvim";
    gitProtocol = "ssh";
  };

  programs.git = (import ./git.nix) (machine.xnixPath + "/commit-template.txt");
}
