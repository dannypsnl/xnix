call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Theme solarized 
Plug 'altercation/vim-colors-solarized', { 'as': 'vim-colors-solarized' }

" Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" tagbar
Plug 'majutsushi/tagbar'
" ctrlp
Plug 'ctrlpvim/ctrlp.vim'
" search file via content
Plug 'mileszs/ack.vim', { 'as': 'ack.vim' }

" Auto
" > Pair
Plug 'jiangmiao/auto-pairs'

" Type-Complete Plugin
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" deoplete: go
Plug 'zchee/deoplete-go', { 'do': 'make' }

" Language
" > Go
Plug 'fatih/vim-go', { 'tag': '*' }
" > Rust 
Plug 'rust-lang/rust.vim'

" Initialize plugin system
call plug#end()

" for deoplete
let g:deoplete#enable_at_startup = 1
" deoplete: go
let g:deoplete#sources#go#sort_class = [ 'package', 'func', 'type', 'var', 'const' ]
let g:deoplete#sources#go#pointer = 1 

" extra setting
set tabstop=4
set shiftwidth=4

set number

" auto commands
let g:rustfmt_autosave = 1

" Only work on MacOS that install ctags by brew
" command `brew install ctags-exuberant`
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
" let ack.vim using ag rather than ack
let g:ackprg = 'ag --vimgrep'

" Theme
syntax on 
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" Mapping key
map <C-n> :NERDTreeToggle<CR>
map <F8> :TagbarToggle<CR>

" Ignore cap
cab W w
cab Wq wq
cab wQ wq
cab WQ wq
cab Q q
