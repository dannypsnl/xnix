local util = require 'lspconfig.util'

local root_files = {
  'info.rkt',
  'req.json',
  '.git',
}

return {
  default_config = {
    cmd = { '/Applications/Racket\ v8.6/bin/racket -l racket-langserver' },
    filetypes = { 'racket' },
    root_dir = function(fname)
      return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
    end,
    offset_encoding = 'utf-32',
    single_file_support = true,
  },
  docs = {
    description = [[
https://github.com/jeapostrophe/racket-langserver
]],
    default_config = {
      root_dir = [[root_pattern('info.rkt', 'req.json', '.git')]],
    },
  },
}
