-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = " " -- use space as <leader>

local opt = vim.opt

opt.backspace = "indent,eol,start"
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.undofile = true
opt.cursorline = true
opt.whichwrap = vim.o.whichwrap .. "<,>,[,]"
opt.hlsearch = true -- highlight search
opt.backup = false -- no backup file
opt.number = true -- show line number
opt.list = false
opt.listchars = "tab:→ ,trail:•"
opt.list = true
opt.mouse = "a" -- allow mouse action
opt.virtualedit = "all" -- allow virtual editing
-- completion setup
opt.completeopt = "menu,menuone,noselect"
