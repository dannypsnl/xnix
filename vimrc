set tabstop=4
set shiftwidth=4
set undofile
set cursorline
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

" Ignore up/low case
cab W w
cab Wq wq
cab wQ wq
cab WQ wq
cab Q q
