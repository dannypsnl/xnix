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
	org_agenda_files = { '~/MEGAsync/org/*' },
	org_default_notes_file = '~/MEGAsync/org/refile.org',
})
