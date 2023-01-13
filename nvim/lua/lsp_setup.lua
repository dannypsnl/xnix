local on_attach = function(client, bufnr)
	require("lsp-inlayhints").on_attach(client, bufnr)

	local keymap = vim.keymap.set
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
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
	keymap("n", "<leader>lp", "<cmd>Lspsaga peek_definition<CR>", bufopts)
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
	keymap("n", "<leader>lo", "<cmd>LSoutlineToggle<CR>", bufopts)
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

	-- Auto formatting
	vim.cmd [[
    augroup Format
      autocmd! * <buffer>
      autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
    augroup END
    ]]
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
local servers = {
	'astro',
	'ocamllsp',
	'gopls',
	'rust_analyzer',
	'julials',
	'sumneko_lua',
	'hls',
	'zls',
}
require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = servers
})
for _, lsp in ipairs({ 'ccls', 'racket_langserver', unpack(servers) }) do
	require('lspconfig')[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end

require('lspfuzzy').setup({})
