-- Load custom treesitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- Treesitter configuration
require('nvim-treesitter.configs').setup {
	-- If TS highlights are not enabled at all, or disabled via `disable` prop,
	-- highlighting will fallback to default Vim syntax highlighting
	highlight = {
		enable = true,
		disable = { "lua" },
		-- Required for spellcheck, some LaTex highlights and
		-- code block highlights that do not have ts grammar
		additional_vim_regex_highlighting = { 'org' },
	},
	auto_install = true,
	ensure_installed = {
		'astro',
		'agda',
		'c',
		'cpp',
		'cmake',
		'nix',
		'org',
		'racket',
		'scheme',
		'ocaml',
		'rust',
		'zig',
		'latex'
	},
}

require('orgmode').setup({
	org_agenda_files = { '~/iCloud/org/*' },
	org_default_notes_file = '~/iCloud/org/inbox.org',
	win_split_mode = function(name)
		local bufnr = vim.api.nvim_create_buf(false, true)
		--- Setting buffer name is required
		vim.api.nvim_buf_set_name(bufnr, name)

		local fill = 0.8
		local width = math.floor((vim.o.columns * fill))
		local height = math.floor((vim.o.lines * fill))
		local row = math.floor((((vim.o.lines - height) / 2) - 1))
		local col = math.floor(((vim.o.columns - width) / 2))

		vim.api.nvim_open_win(bufnr, true, {
			relative = "editor",
			width = width,
			height = height,
			row = row,
			col = col,
			style = "minimal",
			border = "rounded"
		})
	end
})
