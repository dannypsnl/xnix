return {
  { "mfussenegger/nvim-dap" },
  {
    "mrcjkb/haskell-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope.nvim",
        optional = true,
      },
      {
        "mfussenegger/nvim-dap",
        optional = true,
      },
    },
    branch = "2.x.x", -- Recommended
    init = function() -- Optional, see Advanced configuration
      vim.g.haskell_tools = {
        -- ...
        hls = {
          ---@param project_root string Path to the project root
          settings = function(project_root)
            local ht = require("haskell-tools")
            return ht.lsp.load_hls_settings(project_root, {
              settings_file_pattern = "hls.json",
            })
          end,
        },
      }
    end,
    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
  },
}
