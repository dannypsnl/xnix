local keymap = vim.keymap.set
-- Open/close file tree
keymap('n', '<leader>f', '<cmd>NERDTreeToggle<cr>')
-- searching file in project
keymap('n', '<leader>.', '<cmd>GFiles<cr>')
-- searching text in project
keymap('n', '<leader>a', '<cmd>Ag<cr>')
