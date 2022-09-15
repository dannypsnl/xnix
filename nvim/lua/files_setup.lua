local keymap = vim.keymap.set
-- Open/close file tree
keymap('n', '<leader>f', '<cmd>NERDTreeToggle<cr>')
-- searching file in project
keymap('n', '<leader>.', '<cmd>CtrlP<cr>')
