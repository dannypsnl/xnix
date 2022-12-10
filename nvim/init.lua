require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- Themes
    use {
        'karoliskoncevicius/oldbook-vim',
        'karoliskoncevicius/distilled-vim',
        'altercation/vim-colors-solarized',
        'EdenEast/nightfox.nvim',
    }
    -- Code time recording
    use 'wakatime/vim-wakatime'
    -- Git
    use {
        'kdheepak/lazygit.nvim',
        'tpope/vim-fugitive',
        'airblade/vim-gitgutter', -- highlight changes
    }
    -- Tools
    use 'vim-airline/vim-airline'
    use 'preservim/nerdtree'
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'
    use 'jiangmiao/auto-pairs'
    use 'chrisbra/vim-commentary'
    use 'voldikss/vim-floaterm'
    -- REPL
    use 'rhysd/reply.vim'
    -- Language
    use 'benknoble/vim-racket'
    use 'benknoble/scribble.vim'
    -- Language server
    use {
        'neovim/nvim-lspconfig', -- language server configuration
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'williamboman/nvim-lsp-installer', -- client installation
        'lvimuser/lsp-inlayhints.nvim', -- inlay hints in neovim
        'ojroques/nvim-lspfuzzy', -- fuzzy searcher for references
    }
    use {
        'glepnir/lspsaga.nvim',
        branch = 'main',
        config = function()
            require("lsp-inlayhints").setup()
            require('lspsaga').init_lsp_saga()
        end
    }
    -- completion
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            -- unicode supports for theorem prover programming
            { 'kdheepak/cmp-latex-symbols' },
        },
    }
    use {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
    }
end)

local cmd = vim.cmd

vim.g.mapleader = ' ' -- use space as <leader>
-- common useful configuration
vim.o.backspace = 'indent,eol,start'
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
cmd [[ retab ]]
vim.o.undofile = true
vim.o.cursorline = true
vim.o.whichwrap = vim.o.whichwrap .. '<,>,[,]'
vim.o.hlsearch = true -- highlight search
vim.o.backup = false -- no backup file
vim.o.number = true -- show line number
vim.o.list = false
vim.o.listchars = 'tab:→ ,trail:•'
vim.o.list = true
vim.o.mouse = 'a' -- allow mouse action
vim.o.virtualedit = 'all' -- allow virtual editing
-- completion setup
vim.o.completeopt = 'menu,menuone,noselect'

vim.keymap.set('n', '<leader>t', '<cmd>FloatermToggle<cr>')

-- open from last editing point
cmd [[
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
]]
-- close whole editor when only NERDTree window leave
cmd [[
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
      \ && b:NERDTree.isTabTree()) | q | endif
]]

-- themes configuration
cmd [[
syntax enable
"let g:solarized_termcolors=256
"colorscheme solarized
"colorscheme oldbook
"colorscheme distilled
colorscheme dayfox
set termguicolors
]]

-- LSP theme
cmd [[
hi LspInlayHint guifg=#6194ba guibg=#24364b
]]

-- Ignore up/low case and order! I'm typo king
cmd [[
cab W w
cab Q q
cab Wq wq
cab wQ wq
cab WQ wq
cab qw wq
cab QW wq
cab Qw wq
cab qW wq
]]

vim.g.reply_repls = {
    ["racket"] = { "racket" }
}

require("git_setup")
require("window_setup")
require("files_setup")
require("lsp_setup")
