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
