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
