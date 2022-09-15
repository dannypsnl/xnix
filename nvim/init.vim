call plug#begin()
" Themes
Plug 'karoliskoncevicius/oldbook-vim'
Plug 'karoliskoncevicius/distilled-vim'
Plug 'altercation/vim-colors-solarized'
" Code time recording
Plug 'wakatime/vim-wakatime'
" Highlight changes in Git
Plug 'airblade/vim-gitgutter'
" Git operation
Plug 'kdheepak/lazygit.nvim'
Plug 'tpope/vim-fugitive'
" Tools
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'chrisbra/vim-commentary'
" Language
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'benknoble/vim-racket'
Plug 'nvim-orgmode/orgmode'
" Language server
Plug 'neovim/nvim-lspconfig'           " language server configuration
Plug 'williamboman/nvim-lsp-installer' " client installation
Plug 'williamboman/mason.nvim'         " install language server
Plug 'ojroques/nvim-lspfuzzy'          " fuzzy searcher for references
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
""" completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp' | Plug 'hrsh7th/cmp-buffer' | Plug 'hrsh7th/cmp-path' | Plug 'hrsh7th/cmp-cmdline'
Plug 'L3MON4D3/LuaSnip' | Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-vsnip' | Plug 'hrsh7th/vim-vsnip'

call plug#end()

let mapleader="\<Space>"

" Common useful vim configuration
set nobackup
set backspace=indent,eol,start
set expandtab
set tabstop=4
retab
set shiftwidth=4
set undofile
set cursorline
set whichwrap+=<,>,[,]
set hlsearch
" show line number
set number
set nolist
set listchars=tab:→\ ,trail:•
set list

" open from last editing point
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" close whole editor when only NERDTree window leave
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
      \ && b:NERDTree.isTabTree()) | q | endif

let g:ackprg = 'ag --vimgrep'

" allow mouse action
set mouse=a
" allow virtual editing
set virtualedit=all

" Themes configuration
syntax enable
"let g:solarized_termcolors=256
"colorscheme solarized
"colorscheme oldbook
colorscheme distilled
set termguicolors

" Ignore up/low case and order! I'm typo king
cab W w
cab Q q
cab Wq wq
cab wQ wq
cab WQ wq
cab qw wq
cab QW wq
cab Qw wq
cab qW wq

" completion setup
set completeopt=menu,menuone,noselect

lua << EOF
require("setup")
require("setup-org-mode")
EOF
