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
      julia-vim
      vim-go
      zig-vim
      vim-stylish-haskell
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
