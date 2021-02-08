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
    elixir
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
  programs.neovim = (import ./neovim.nix){ pkgs = pkgs; };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "dotenv"
        "osx"
      ];
      theme = "robbyrussell";
    };

    plugins = [];

    shellAliases = {
      g = "git";
      ls = "ls -GFh";
      ll = "ls -l";
      la = "ll -a";
      lm = "ll | more";
      lam = "la | more";
      vi = "nvim";
      vim = "nvim";
    };

    initExtraFirst =
    if isMacOS then ''
    source $HOME/.macos-extra
    '' else "";
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.gh = {
    enable = true;
    editor = "nvim";
    gitProtocol = "ssh";
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
    ignores = [
      "*~" "*.swp" "*.o" "*.a" "*.so" "*.aux" "*.dylib"
      # editor/IDE
      ".idea/" ".vscode/"
      ".ccls-cache/"
    ];
    extraConfig = {
      init.defaultBranch = "develop";
      core.editor = "nvim";
      color.ui = true;
      branch.autosetuprebase = "always";
      push.default = "current";
      rebase.autosquash = true;
      commit.template = machine.xnixPath + "/commit-template.txt";
    };
  };
}
