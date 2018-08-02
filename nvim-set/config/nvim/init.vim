call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Type-Complete Plugin
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" deoplete: go
Plug 'zchee/deoplete-go', { 'do': 'make' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Initialize plugin system
call plug#end()

" for deoplete
let g:deoplete#enable_at_startup = 1
" deoplete: go
let g:deoplete#sources#go#sort_class = [ 'package', 'func', 'type', 'var', 'const' ]
let g:deoplete#sources#go#pointer = 1 
let g:deoplete#sources#go#cgo = 1 

" extra setting
set tabstop=4
set shiftwidth=4

" Mapping key
map <C-n> :NERDTreeToggle<CR>
