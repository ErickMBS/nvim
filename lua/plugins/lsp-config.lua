return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        PATH = "prepend",
      })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "csharp_ls",
          "omnisharp",
          "cssls",
          "html",
          "tsserver",
          "quick_lint_js",
          "pylsp",
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.csharp_ls.setup({})
      lspconfig.omnisharp.setup({})
      lspconfig.cssls.setup({})
      lspconfig.eslint.setup({})
      lspconfig.html.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.quick_lint_js.setup({})
      lspconfig.pylsp.setup({})

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}

