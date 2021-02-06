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
    # dev tools
    tig
    silver-searcher
    ant
    vagrant
    fzf
    # language
    racket
    elan
    coq
    agda
    idris
    rustup
    gcc gdb gnumake cmake clang-tools llvm
    nodejs
    go
    python3
    jdk14
    # nice tools
    youtube-dl # youtube downloader
    unzip
    wget
    tdesktop # telegram
  ];

  programs.neovim = {
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
    extraConfig = ''
      set tabstop=4
      set shiftwidth=4
      set undofile
      set cursorline
      set number
      set nolist
      set listchars=tab:→\ ,trail:•
      set list
      if has("autocmd")
        au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
      endif

      let g:ackprg = 'ag --vimgrep'

      set mouse=a
      set virtualedit=all

      " Theme
      syntax enable
      let g:solarized_termcolors=256
      colorscheme solarized
      set termguicolors

      " Mapping key
      map <C-n> :NERDTreeToggle<CR>
      " Improve window switching, remove <C-W>
      map <C-J> <C-W><C-J>
      map <C-K> <C-W><C-K>
      map <C-L> <C-W><C-L>
      map <C-H> <C-W><C-H>

      cab W w
      cab Wq wq
      cab wQ wq
      cab WQ wq
      cab Q q
    '';
  };

  programs.emacs = {
    enable = true;
    extraPackages = epkgs: with epkgs; [
      agda2-mode
      idris-mode
      racket-mode
      magit
    ];
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
  };

  programs.direnv.enable = true;

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
    };
  };
}
