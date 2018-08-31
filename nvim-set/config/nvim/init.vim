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
" > Format
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" Type-Complete Plugin
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" deoplete: go
Plug 'zchee/deoplete-go', { 'do': 'make' }
" deoplete: rust
Plug 'sebastianmarkow/deoplete-rust'

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
" deoplete: rust
let g:deoplete#sources#rust#racer_binary='/Users/dannypsnl/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/Users/dannypsnl/workspace/rust/src'

" extra setting
set tabstop=4
set shiftwidth=4
" > hightlight cursor's current line
set cursorline
" > show line number
set number
" > highlight <tab>, trail char
set nolist
set listchars=tab:→\ ,trail:•
set list
" > Open from last quit position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" auto commands
let g:rustfmt_autosave = 1
call glaive#Install()
augroup autoformat_settings
  autocmd FileType c,cpp,proto AutoFormatBuffer clang-format
augroup END

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
