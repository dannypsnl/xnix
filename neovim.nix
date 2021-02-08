pkgs:
{
  enable = true;
  viAlias = true;
  vimAlias = true;
  plugins = with pkgs.vimPlugins; [
    nerdtree
    # theme
    solarized #oldbook-vim distilled-vim
    ack-vim ctrlp
    coc-nvim
    airline
    vim-clap
    vim-fugitive vim-gitgutter
    vim-commentary
    auto-pairs
    fzf-vim
    julia-vim
    vim-go
  ];
  extraConfig = builtins.readFile ./vimrc;
}
