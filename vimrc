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
Plug 'benknoble/vim-racket'
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'ojroques/nvim-lspfuzzy'
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
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

lua << EOF
local keymap = vim.keymap.set
-- Open/close file tree
keymap('n', '<leader>f', '<cmd>NERDTreeToggle<CR>')
-- Window
keymap('n', '<leader>ws', '<C-W>s')
keymap('n', '<leader>wv', '<C-W>v')
-- Improve window switching, remove <C-W>
keymap('n', '<leader>w<down>', '<C-W><C-J>')
keymap('n', '<leader>w<up>', '<C-W><C-K>')
keymap('n', '<leader>w<right>', '<C-W><C-L>')
keymap('n', '<leader>w<left>', '<C-W><C-H>')

-- Git keymappings
keymap('n', '<leader>g', '<cmd>LazyGit<CR>')

-- language server
require("mason").setup()
require('lspsaga').init_lsp_saga()

local on_attach = function(client, bufnr)
  local keymap = vim.keymap.set
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  -- Lsp finder find the symbol definition implement reference
  -- when you use action in finder like open vsplit then you can
  -- use <C-t>to jump back
  keymap("n", "<leader>lf", "<cmd>Lspsaga lsp_finder<CR>", bufopts)
  -- Goto definition
  keymap('n', '<leader>lD', vim.lsp.buf.declaration, bufopts)
  keymap('n', '<leader>ld', vim.lsp.buf.definition, bufopts)
  keymap('n', '<leader>li', vim.lsp.buf.implementation, bufopts)
  -- Definition preview
  keymap('n', '<leader>lt', vim.lsp.buf.type_definition, bufopts)
  keymap("n", "<leader>lp", "<cmd>Lspsaga preview_definition<CR>", bufopts)
  -- Goto references
  keymap('n', '<leader>lu', vim.lsp.buf.references, bufopts)
  -- Hover Doc
  keymap("n", "<leader>lh", "<cmd>Lspsaga hover_doc<CR>", bufopts)
  -- Rename
  keymap("n", "<leader>lr", "<cmd>Lspsaga rename<CR>", bufopts)
  -- Code action
  keymap("n", "<leader>lc", "<cmd>Lspsaga code_action<CR>", bufopts)
  keymap("v", "<leader>lc", "<cmd>Lspsaga range_code_action<CR>", bufopts)
  -- Show line diagnostics
  keymap("n", "<leader>lld", "<cmd>Lspsaga show_line_diagnostics<CR>", bufopts)
  -- Show cursor diagnostic
  keymap("n", "<leader>llc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", bufopts)
  -- Outline
  keymap("n","<leader>lo", "<cmd>LSoutlineToggle<CR>", bufopts)
  -- Diagnsotic jump can use `<c-o>` to jump back
  keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
  keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)
  -- Only jump to error
  keymap("n", "[E", function()
    require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
  end, bufopts)
  keymap("n", "]E", function()
    require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
  end, bufopts)

  -- Float terminal
  -- FIXME: close float terminal has problem
  --keymap("n", "<leader>t", "<cmd>Lspsaga open_floaterm<CR>", bufopts)
  -- close floaterm
  --keymap("t", "<leader>t", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], bufopts)

  -- Auto formatting
  vim.cmd [[augroup Format]]
  vim.cmd [[autocmd! * <buffer>]]
  vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
  vim.cmd [[augroup END]]
end

local servers = {
  'astro',
  'ccls',
  'ocamllsp',
  'racket_langserver',
  'rust_analyzer',
  'hls',
  'zls'
}
for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup { on_attach = on_attach }
end

require('lspfuzzy').setup {}
EOF
