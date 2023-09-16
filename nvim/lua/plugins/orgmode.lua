return {
  { "akinsho/org-bullets.nvim" },
  {
    "nvim-orgmode/orgmode",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require('orgmode').setup_ts_grammar()
      require('orgmode').setup({
        org_capture_templates = {
          t = {
            description = 'Task',
            template = [[
* TODO %?
  %U SCHEDULED: %t
]],
            target = '~/org/inbox.org'
          },
          v = {
            description = 'Violet',
            template = [[
* TODO [#A] %?
  %U SCHEDULED: %t
]],
            target = '~/org/violet.org'
          },
          w = {
            description = 'Work',
            template = [[
* TODO [#A] %?
  %U SCHEDULED: %t
]],
            target = '~/org/secondstate.org'
          },
          m = {
            description = 'Weekly Meeting',
            template = [[
* TODO [#A] meeting
  %U SCHEDULED: <%<%Y-%m-%d %a 16:00>>--<%<%Y-%m-%d %a 18:00>>
]],
            target = '~/org/secondstate.org'
          },
          e = {
            description = 'Exercise',
            template = [[
* TODO [#B] exercise
  %U SCHEDULED: %t
** TODO 伏地挺身 * 20 * 2
** TODO 核心抬腳 * 30 * 3
** TODO 柔軟操 * 10 min
** TODO 背部伸展 * 30
** TODO 深蹲 * 20
]],
            target = '~/org/exercise.org'
          },
          j = {
            description = 'Japanese',
            template = [[
* TODO [#D] Duolingo
  %U SCHEDULED: %t
]],
            target = '~/org/japanese.org'
          },
          f = {
            description = 'Finnish/Suomi',
            template = [[
* TODO [#D] Duolingo
  %U SCHEDULED: %t
]],
            target = '~/org/suomi.org'
          },
          u = {
            description = 'University',
            template = [[
* TODO [#B] %?
  %U SCHEDULED: %t
]],
            target = '~/org/univ.org'
          },
        },
        org_agenda_files = { "~/org/*" },
        org_default_notes_file = "~/org/inbox.org",
        org_tags_column = 120,
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
            border = "rounded",
          })
        end,
      })
    end,
  }
}
