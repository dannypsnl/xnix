pkgs:
let
  customPlugins = {
    oldbook-vim = pkgs.vimUtils.buildVimPlugin {
      name = "oldbook-vim";
      src = pkgs.fetchFromGitHub {
        owner = "karoliskoncevicius";
        repo = "oldbook-vim";
        rev = "master";
        sha256 = "1jrnl2947kv7gxw6jhybjglxav3w9173lp3421jv59xmi5bw0a9x";
      };
    };
    distilled-vim = pkgs.vimUtils.buildVimPlugin {
      name = "distilled-vim";
      src = pkgs.fetchFromGitHub {
        owner = "karoliskoncevicius";
        repo = "distilled-vim";
        rev = "master";
        sha256 = "182xcmlb10h611m0awrbj41pz5phn2smvclzn9rajzal4ihwlg2g";
      };
    };
  };
  p = pkgs.vimPlugins // customPlugins;
in {
  enable = true;
  viAlias = true;
  vimAlias = true;
  plugins = with p; [
    nerdtree
    # theme
    solarized
    oldbook-vim
    distilled-vim
    # tools
    ack-vim
    ctrlp
    coc-nvim
    airline
    vim-clap
    vim-fugitive
    vim-gitgutter
    vim-commentary
    auto-pairs
    fzf-vim
    julia-vim
    vim-go
  ];
  extraConfig = builtins.readFile ./vimrc;
}
