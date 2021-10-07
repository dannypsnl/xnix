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
      tig
      cloc
      croc
      silver-searcher
      unzip
      curl
      wget
      htop
      ffmpeg
      graphviz
      youtube-dl
      postgresql
      gradle
      chez
      sbcl
      (agda.withPackages [ agdaPackages.standard-library ])
      idris2
      nasm
      gnumake
      clang-tools
      ccls
      gcc
      llvm_12
      rustc
      cargo
      rls
      rebar3
      erlang
      elixir
      nodejs
      nodePackages.pnpm
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
      kubectl
      kubernetes-helm
      kube3d
      google-cloud-sdk
      transcrypt
    ] ++ lib.optionals isMacOS [
      vagrant
      zig
      stack
      ghc
      haskell-language-server
      stylish-haskell
      gtk3
      nodePackages.gatsby-cli
    ];

  home.file.".agda/libraries".text = builtins.readFile ./agda/libraries;
  home.file.".agda/defaults".text = builtins.readFile ./agda/defaults;

  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        dimensions = {
          lines = 3;
          columns = 200;
        };
        startup_mode = "Maximized";
      };
      font = {
        normal = { family = "PragmataPro Mono Liga"; };
        size = 14;
      };
      colors = {
        primary = {
          background = "#2e3440";
          foreground = "#d8dee9";
          dim_foreground = "#a5abb6";
        };
        cursor = {
          text = "#2e3440";
          cursor = "#d8dee9";
        };
        selection = {
          text = "CellForeground";
          background = "#4c566a";
        };
        search = {
          matches = {
            foreground = "CellBackground";
            background = "#88c0d0";
          };
          bar = {
            background = "#434c5e";
            foreground = "#d8dee9";
          };
        };
        normal = {
          black = "#3b4252";
          red = "#bf616a";
          green = "#a3be8c";
          yellow = "#ebcb8b";
          blue = "#81a1c1";
          magenta = "#b48ead";
          cyan = "#88c0d0";
          white = "#e5e9f0";
        };
        bright = {
          black = "#4c566a";
          red = "#bf616a";
          green = "#a3be8c";
          yellow = "#ebcb8b";
          blue = "#81a1c1";
          magenta = "#b48ead";
          cyan = "#8fbcbb";
          white = "#eceff4";
        };
        dim = {
          black = "#373e4d";
          red = "#94545d";
          green = "#809575";
          yellow = "#b29e75";
          blue = "#68809a";
          magenta = "#8c738c";
          cyan = "#6d96a5";
          white = "#aeb3bb";
        };
      };
      key_bindings = lib.optionals isNixOS [
        {
          key = "C";
          mods = "Super";
          action = "Copy";
        }
        {
          key = "V";
          mods = "Super";
          action = "Paste";
        }
        {
          key = "K";
          mods = "Super";
          action = "ClearHistory";
        }
        {
          key = "Q";
          mods = "Super";
          action = "Quit";
        }
        {
          key = "F";
          mods = "Super";
          mode = "~Search";
          action = "SearchForward";
        }
        {
          key = "Return";
          mode = "Search";
          action = "SearchFocusNext";
        }
        {
          key = "Return";
          mods = "Shift";
          mode = "Search";
          action = "SearchFocusPrevious";
        }
      ];
    };
  };

  programs.vscode = {
    enable = isNixOS;
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.Nix
      WakaTime.vscode-wakatime
      ms-vsliveshare.vsliveshare
    ];
    userSettings = {
      "workbench.colorTheme" = "Visual Studio Light";
      "editor.fontSize" = 13;
      "editor.defaultFormatter" = "JakeBecker.elixir-ls";
      "editor.formatOnSave" = true;
      "editor.fontFamily" = "'PragmataPro Mono Liga'";
    };
  };

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
