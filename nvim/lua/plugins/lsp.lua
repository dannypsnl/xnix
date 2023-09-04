return {
  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "ocaml-lsp",
        "julia-lsp",
        "zls",
        "elixir-ls",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
      { "folke/neodev.nvim", opts = {} },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      {
        "hrsh7th/cmp-nvim-lsp",
        cond = function()
          return require("lazyvim.util").has("nvim-cmp")
        end,
      },
    },
    keys = {
      { "<leader>ld", vim.lsp.buf.definition },
      { "<leader>lD", vim.lsp.buf.declaration },
      { "<leader>li", vim.lsp.buf.implementation },
      { "<leader>lt", vim.lsp.buf.type_definition },
      { "<leader>lu", vim.lsp.buf.references },
      { "<leader>lr", vim.lsp.buf.rename },
    },
    ---@class PluginLspOpts
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
          -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
          -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
          -- prefix = "icons",
        },
        severity_sort = true,
      },
      -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the inlay hints.
      inlay_hints = {
        enabled = true,
      },
      ---@type lspconfig.options
      servers = {
        ocamllsp = {},
        rust_analyzer = {
          settings = {},
        },
        julials = {
          settings = {},
        },
        elixirls = {
          settings = {},
        },
        zls = {
          settings = {},
        },
      },
    },
  },
}
