call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Theme solarized
Plug 'altercation/vim-colors-solarized', { 'as': 'vim-colors-solarized' }
Plug 'KKPMW/oldbook-vim'
Plug 'KKPMW/distilled-vim'

" Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" tagbar
Plug 'majutsushi/tagbar'
" ctrlp
Plug 'ctrlpvim/ctrlp.vim'
" search file via content
Plug 'mileszs/ack.vim', { 'as': 'ack.vim' }

" Git
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'airblade/vim-gitgutter'
" Comment
Plug 'tpope/vim-commentary'

" Auto
" > Pair
Plug 'jiangmiao/auto-pairs'
" > Format
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" Spell check
Plug 'kamykn/spelunker.vim'

" Language Server
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" Multi-entry selection UI
Plug 'junegunn/fzf'
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
" > Peg
Plug 'pest-parser/pest.vim'

" Funny
Plug 'johngrib/vim-game-code-break'

" Initialize plugin system
call plug#end()

" For Language Server
set hidden
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'go': ['$GOPATH/bin/bingo'],
    \ 'cpp': ['ccls'],
    \ 'c': ['ccls'],
    \ 'python': ['pyls'],
    \ }
map <C-b> :call LanguageClient#textDocument_definition()<CR>
map <C-d> :call LanguageClient#textDocument_hover()<CR>
map <C-r> :call LanguageClient#textDocument_rename()<CR>
map <C-a> :call LanguageClient#textDocument_references()<CR>

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
set undofile
" Spell check
let g:enable_spelunker_vim = 1
" > highlight cursor's current line
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
" > allow mouse
set mouse=a

" auto commands
let g:rustfmt_autosave = 1
call glaive#Install()
augroup autoformat_settings
  autocmd FileType c,cpp AutoFormatBuffer clang-format
  autocmd FileType python AutoFormatBuffer autopep8
augroup END

" Only work on MacOS that install ctags by brew
" command `brew install ctags-exuberant`
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
autocmd BufEnter * nested :call tagbar#autoopen(0)
" let ack.vim using ag rather than ack
let g:ackprg = 'ag --vimgrep'

" Theme
syntax on
let g:solarized_termcolors=256
set background=dark
" Optional Theme
" colorscheme solarized
colorscheme distilled
set termguicolors

" Mapping key
map <C-n> :NERDTreeToggle<CR>
map <C-J> <C-W><C-J>
map <C-K> <C-W><C-K>
map <C-L> <C-W><C-L>
map <C-H> <C-W><C-H>

" Ignore cap
cab W w
cab Wq wq
cab wQ wq
cab WQ wq
cab Q q
