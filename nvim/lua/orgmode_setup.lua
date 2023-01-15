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
	org_agenda_files = { '~/org/*' },
	org_default_notes_file = '~/org/inbox.org',

	-- org view config
	org_tags_column = 120,

	-- agenda config
	org_capture_templates = {
		t = {
			description = 'Task',
			template = [[
* TODO %?
  %U]]
		},
		v = {
			description = 'Violet',
			template = [[
* TODO [#A] %?
  %U]],
			target = '~/org/violet.org'
		},
		w = {
			description = 'Work',
			template = [[
* TODO [#A] %?
  %U SCHEDULED: %t]],
			target = '~/org/secondstate.org'
		},
		e = {
			description = 'Exercise',
			template = [[
* TODO [#B] exercise
  %U SCHEDULED: %t
** TODO 伏地挺身 * 30
** TODO 核心抬腳 * 60
** TODO 柔軟操
** TODO 背部伸展 * 20
** TODO 深蹲 * 20]],
			target = '~/org/inbox.org'
		},
		f = {
			description = 'Finnish/Suomi',
			template = [[
* TODO [#D] duolingo
  SCHEDULED: %t]],
			target = '~/org/suomi.org'
		},
	},
	-- window config
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
