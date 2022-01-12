{ pkgs, ... }:
let vimPlug = pkgs.vimUtils.buildVimPlugin;
in {
  copilot = vimPlug {
    pname = "copilot";
    version = "release";
    src = pkgs.fetchFromGitHub {
      owner = "github";
      repo = "copilot.vim";
      rev = "release";
      sha256 = "sha256-gnFiuXpKF55cWxCXNXe3zqQaVmGoUV5aRBGIlyUUfIM=";
    };
  };
  oldbook-vim = vimPlug {
    pname = "oldbook-vim";
    version = "master";
    src = pkgs.fetchFromGitHub {
      owner = "karoliskoncevicius";
      repo = "oldbook-vim";
      rev = "master";
      sha256 = "1jrnl2947kv7gxw6jhybjglxav3w9173lp3421jv59xmi5bw0a9x";
    };
  };
  distilled-vim = vimPlug {
    pname = "distilled-vim";
    version = "master";
    src = pkgs.fetchFromGitHub {
      owner = "karoliskoncevicius";
      repo = "distilled-vim";
      rev = "master";
      sha256 = "182xcmlb10h611m0awrbj41pz5phn2smvclzn9rajzal4ihwlg2g";
    };
  };
  wakatime = vimPlug {
    pname = "wakatime";
    version = "master";
    src = pkgs.fetchFromGitHub {
      owner = "wakatime";
      repo = "vim-wakatime";
      rev = "master";
      sha256 = "sha256-PFbXffeQLL2/n/xeIvsiZ1WzZVf0aPIFT/h1Kr3gMpM=";
    };
  };
  nix-vim = vimPlug {
    pname = "nix-vim";
    version = "master";
    src = pkgs.fetchFromGitHub {
      owner = "LnL7";
      repo = "vim-nix";
      rev = "master";
      sha256 = "sha256-wQzNXfE7JFalgiCQ2ksPAUyFKacmJV7mNKmKDe9jySI=";
    };
  };
}
