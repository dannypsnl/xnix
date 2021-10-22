pkgs: lib: isMacOS:
let
  customPlugins = {
    oldbook-vim = pkgs.vimUtils.buildVimPlugin {
      pname = "oldbook-vim";
      version = "master";
      src = pkgs.fetchFromGitHub {
        owner = "karoliskoncevicius";
        repo = "oldbook-vim";
        rev = "master";
        sha256 = "1jrnl2947kv7gxw6jhybjglxav3w9173lp3421jv59xmi5bw0a9x";
      };
    };
    distilled-vim = pkgs.vimUtils.buildVimPlugin {
      pname = "distilled-vim";
      version = "master";
      src = pkgs.fetchFromGitHub {
        owner = "karoliskoncevicius";
        repo = "distilled-vim";
        rev = "master";
        sha256 = "182xcmlb10h611m0awrbj41pz5phn2smvclzn9rajzal4ihwlg2g";
      };
    };
    wakatime = pkgs.vimUtils.buildVimPlugin {
      pname = "wakatime";
      version = "master";
      src = pkgs.fetchFromGitHub {
        owner = "wakatime";
        repo = "vim-wakatime";
        rev = "master";
        sha256 = "sha256-2tmYKRPzt/T5Tx2qv1QOtxCLwpyx4xeLC49rHnGDJto=";
      };
    };
    nix-vim = pkgs.vimUtils.buildVimPlugin {
      pname = "nix-vim";
      version = "master";
      src = pkgs.fetchFromGitHub {
        owner = "LnL7";
        repo = "vim-nix";
        rev = "master";
        sha256 = "sha256-wQzNXfE7JFalgiCQ2ksPAUyFKacmJV7mNKmKDe9jySI=";
      };
    };
    racket-vim = pkgs.vimUtils.buildVimPlugin {
      pname = "racket-vim";
      version = "master";
      src = pkgs.fetchFromGitHub {
        owner = "dannypsnl";
        repo = "racket.vim";
        rev = "develop";
        sha256 = "sha256-r6ICrOkbVZJ/zpwrj0Kc3c03JG59zux+maWAjqo5NL8=";
      };
    };
  };
  plugins = with pkgs.vimPlugins // customPlugins;
    [
      nerdtree
      # theme
      solarized
      oldbook-vim
      distilled-vim
      nord-vim
      # tools
      ack-vim
      ctrlp
      coc-nvim
      airline
      vim-fugitive
      vim-gitgutter
      vim-commentary
      auto-pairs
      fzf-vim
      racket-vim
      julia-vim
      vim-go
      zig-vim
      nix-vim
      vim-stylish-haskell
      wakatime
    ] ++ lib.optionals isMacOS [ idris2-vim ];
  config = builtins.readFile ./vimrc;
in if isMacOS then {
  enable = true;
  plugins = plugins;
  extraConfig = config;
} else {
  enable = true;
  plugins = plugins;
  withPython = false;
  extraConfig = config;
}
