local keymap = vim.keymap.set
-- Open/close file tree
keymap('n', '<leader>f', '<cmd>NvimTreeToggle<cr>')
-- searching file in project
keymap('n', '<leader>.', '<cmd>GFiles<cr>')
-- searching text in project
keymap('n', '<leader>a', '<cmd>Ag<cr>')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	sort_by = "case_sensitive",
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})
