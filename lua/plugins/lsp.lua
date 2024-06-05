return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").csharp_ls.setup({
        on_attach = function(client, bufnr)
          local buf_set_keymap = vim.api.nvim_buf_set_keymap
          local buf_set_option = vim.api.nvim_buf_set_option
          buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

          -- Mapeamentos LSP
          local opts = { noremap = true, silent = true }
          buf_set_keymap(bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
          buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
          buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
          buf_set_keymap(bufnr, "n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
          buf_set_keymap(bufnr, "n", "<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
          buf_set_keymap(bufnr, "n", "<space>wa", "<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
          buf_set_keymap(bufnr, "n", "<space>wr", "<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
          buf_set_keymap(
            bufnr,
            "n",
            "<space>wl",
            "<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
            opts
          )
          buf_set_keymap(bufnr, "n", "<space>D", "<Cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
          buf_set_keymap(bufnr, "n", "<space>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
          buf_set_keymap(bufnr, "n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
          buf_set_keymap(
            bufnr,
            "n",
            "<space>e",
            "<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",
            opts
          )
          buf_set_keymap(bufnr, "n", "[d", "<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
          buf_set_keymap(bufnr, "n", "]d", "<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
          buf_set_keymap(bufnr, "n", "<space>q", "<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
          buf_set_keymap(bufnr, "n", "<space>f", "<Cmd>lua vim.lsp.buf.formatting()<CR>", opts)

          -- Mapeamentos adicionais similares ao VSCode
          buf_set_keymap(bufnr, 'n', '<F12>', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
          buf_set_keymap(bufnr, 'n', '<S-F12>', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
          buf_set_keymap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
          buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
          buf_set_keymap(bufnr, 'n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        end,
      })
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    requires = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "csharp_ls", "lua_ls" },
      })
    end,
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    event = "VeryLazy",
    config = function()
      require("lsp_lines").setup()

      vim.diagnostic.config({
        virtual_lines = false,
        virtual_text = true,
      })

      local function toggleLines()
        local new_value = not vim.diagnostic.config().virtual_lines
        vim.diagnostic.config({ virtual_lines = new_value, virtual_text = not new_value })
        return new_value
      end

      vim.keymap.set("n", "<leader>lu", toggleLines, { desc = "Toggle Underline Diagnostics", silent = true })
    end,
  },
}
