call plug#begin()
" Themes
Plug 'karoliskoncevicius/oldbook-vim'
Plug 'karoliskoncevicius/distilled-vim'
Plug 'altercation/vim-colors-solarized'
" Code time recording
Plug 'wakatime/vim-wakatime'
" Highlight changes in Git
Plug 'airblade/vim-gitgutter'
" Tools
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'chrisbra/vim-commentary'
" Language
Plug 'benknoble/vim-racket'
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
call plug#end()

let mapleader="\<Space>"

" Open/close file tree
nnoremap <leader>f :NERDTreeToggle<CR>
" Window
map <leader>ws       <C-W>s
map <leader>wv       <C-W>v
" Improve window switching, remove <C-W>
map <leader>w<down>  <C-W><C-J>
map <leader>w<up>    <C-W><C-K>
map <leader>w<right> <C-W><C-L>
map <leader>w<left>  <C-W><C-H>

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
