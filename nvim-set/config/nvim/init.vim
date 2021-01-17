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
" ctrlp
Plug 'ctrlpvim/ctrlp.vim'
" search file via content
Plug 'mileszs/ack.vim', { 'as': 'ack.vim' }
" Clap
Plug 'liuchengxu/vim-clap'

" Git
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'airblade/vim-gitgutter'
" Comment, command `:Commentary`
Plug 'tpope/vim-commentary'

" Auto
" > Pair
Plug 'jiangmiao/auto-pairs'
" > Format
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'Chiel92/vim-autoformat'

" Language Server
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" Multi-entry selection UI
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Type-Complete Plugin
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" deoplete: rust
Plug 'sebastianmarkow/deoplete-rust'

" Language
" > Coq
Plug 'whonore/Coqtail'
" > Idris 2
Plug 'edwinb/idris2-vim'
" > Go
Plug 'fatih/vim-go', { 'tag': '*' }
" > Rust
Plug 'rust-lang/rust.vim'
" > Pie
Plug 'felipesere/pie-highlight.vim'
" > Julia
Plug 'JuliaEditorSupport/julia-vim'

" Funny
" Plug 'johngrib/vim-game-code-break'

" Initialize plugin system
call plug#end()

" For Language Server
set hidden
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'go': ['$GOPATH/bin/gopls'],
    \ 'cpp': ['ccls'],
    \ 'c': ['ccls'],
    \ }
map <C-b> :call LanguageClient#textDocument_definition()<CR>
map <C-d> :call LanguageClient#textDocument_hover()<CR>
map <C-r> :call LanguageClient#textDocument_rename()<CR>
map <C-a> :call LanguageClient#textDocument_references()<CR>

" for deoplete
let g:deoplete#enable_at_startup = 1
" deoplete: rust
let g:deoplete#sources#rust#racer_binary='$HOME/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='$HOME/.cargo/rust/src'

" extra setting
set tabstop=4
set shiftwidth=4
set undofile
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
" > allow to move cursor freely in the buffer
set virtualedit=all

" auto commands
let g:rustfmt_autosave = 1
call glaive#Install()
augroup autoformat_settings
  autocmd FileType c,cpp AutoFormatBuffer clang-format
augroup END

" let ack.vim using ag rather than ack
let g:ackprg = 'ag --vimgrep'

" Theme
syntax enable
"let g:solarized_termcolors=256
"set background=light
" > Option
"colorscheme solarized
colorscheme distilled
"colorscheme oldbook
set termguicolors

" idris2 vim
filetype on
filetype plugin indent on
" Agda
au BufNewFile,BufRead *.agda setf agda
"" Disable jump to definition to speed up the loads
let g:agdavim_enable_goto_definition = 0

" Mapping key
map <C-n> :NERDTreeToggle<CR>
" Improve window switching, remove <C-W>
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
