require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Themes
  use 'karoliskoncevicius/oldbook-vim'
  use 'karoliskoncevicius/distilled-vim'
  use 'altercation/vim-colors-solarized'
  -- Code time recording
  use 'wakatime/vim-wakatime'
  -- Git
  use 'kdheepak/lazygit.nvim'
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter' -- highlight changes
  -- Tools
  use 'vim-airline/vim-airline'
  use 'preservim/nerdtree'
  use 'kien/ctrlp.vim'
  use 'mileszs/ack.vim'
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'jiangmiao/auto-pairs'
  use 'chrisbra/vim-commentary'
  -- Language
  use 'nvim-treesitter/nvim-treesitter'
  use 'benknoble/vim-racket'
  use 'nvim-orgmode/orgmode'
  -- Language server
  use 'neovim/nvim-lspconfig'           -- language server configuration
  use 'williamboman/nvim-lsp-installer' -- client installation
  use 'williamboman/mason.nvim'         -- install language server
  use 'ojroques/nvim-lspfuzzy'          -- fuzzy searcher for references
  use {
    'glepnir/lspsaga.nvim',
    branch = 'main'
  }
  -- completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
end)

vim.cmd [[
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
]]

require("git")
require("window")
require("lsp_setup")
require("setup-org-mode")
