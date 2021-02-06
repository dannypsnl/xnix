{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "dannypsnl";
  home.homeDirectory = "/home/dannypsnl";

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
    # editor
    neovim
    # dev tools
    tig
    silver-searcher
    ant
    vagrant
    # language
    racket
    elan
    coq
    agda
    idris
    rustup
    gcc
    gdb
    gnumake
    cmake
    clang-tools
    llvm
    nodejs
    go
    python3
    jdk14
    # env
    direnv
    # nice tools
    youtube-dl # youtube downloader
    unzip
    wget
    tdesktop # telegram
  ];

  programs.emacs = {
    enable = true;
    extraPackages = epkgs: with epkgs; [
      agda2-mode
      idris-mode
      racket-mode
      magit
    ];
  };

  programs.git = {
    enable = true;
    userName = "Lîm Tsú-thuàn";
    userEmail = "dannypsnl@gmail.com";
    aliases = {
      co = "checkout";
      cm = "commit";
      br = "branch";
      mg = "merge";
      df = "diff";
      st = "status";
      ad = "add";
      rb = "rebase";
      tree = "log --graph --decorate --pretty=oneline --abbrev-commit";
    };
    ignores = [ "*~" "*.swp" "*.o" "*.a" "*.so" "*.aux" "*.dylib" ];
    extraConfig = {
      init.defaultBranch = "develop";
      core.editor = "nvim";
      color.ui = true;
      branch.autosetuprebase = "always";
      push.default = "current";
      rebase.autosquash = true;
    };
  };
}
