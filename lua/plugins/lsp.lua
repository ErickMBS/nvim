return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "onsails/lspkind.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")

      -- Configuração comum para todos os servidores
      local on_attach = function(client, bufnr)
        local buf_set_keymap = vim.api.nvim_buf_set_keymap
        local buf_set_option = vim.api.nvim_buf_set_option
        buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

        -- Mapeamentos LSP
        local opts = { noremap = true, silent = true }
        buf_set_keymap(bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
        buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
        buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
        buf_set_keymap(bufnr, "n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
        buf_set_keymap(bufnr, "n", "<leader>k", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
        buf_set_keymap(bufnr, "n", "<leader>wa", "<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
        buf_set_keymap(bufnr, "n", "<leader>wr", "<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
        buf_set_keymap(
          bufnr,
          "n",
          "<space>wl",
          "<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
          opts
        )
        buf_set_keymap(bufnr, "n", "<leader>D", "<Cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
        buf_set_keymap(bufnr, "n", "<leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
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
        buf_set_keymap(bufnr, "n", "<leader>q", "<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
        buf_set_keymap(bufnr, "n", "<leader>f", "<Cmd>lua vim.lsp.buf.formatting()<CR>", opts)

        -- Mapeamentos adicionais similares ao VSCode
        buf_set_keymap(bufnr, 'n', '<F12>', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap(bufnr, 'i', '<F12>', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap(bufnr, 'n', '<leader><F12>', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap(bufnr, 'i', '<S-F12>', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap(bufnr, 'n', '<leader>.', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        buf_set_keymap(bufnr, 'v', '<leader>.', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        buf_set_keymap(bufnr, 'i', '>.', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
      end

      -- Capabilities padrão
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      -- Se você usar cmp-nvim-lsp, descomente a linha abaixo para adicionar capabilities do cmp
      -- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      require("mason").setup()
      mason_lspconfig.setup({
        ensure_installed = {
          "csharp_ls",
          "lua_ls",
          "ts_ls",
          "eslint",
          "angularls",
        },
        handlers = {
          -- Handler padrão para servidores sem configuração específica
          function(server_name)
            lspconfig[server_name].setup({
              on_attach = on_attach,
              capabilities = capabilities,
            })
          end,

          -- Configuração específica para csharp_ls
          ["csharp_ls"] = function()
            lspconfig.csharp_ls.setup({
              on_attach = on_attach,
              capabilities = capabilities,
              settings = {
                csharp = {
                  autoInsertUsings = true,
                },
              },
            })
          end,

          -- Configuração específica para lua_ls
          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
              on_attach = on_attach,
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim" },
                  },
                },
              },
            })
          end,

          -- Configuração específica para ts_ls
          ["ts_ls"] = function()
            local function organize_imports()
              local params = {
                command = "_typescript.organizeImports",
                arguments = { vim.api.nvim_buf_get_name(0) },
              }
              vim.lsp.buf.execute_command(params)
            end

            lspconfig.ts_ls.setup({
              on_attach = on_attach,
              capabilities = capabilities,
              init_options = {
                preferences = {
                  disableSuggestions = true,
                }
              },
              commands = {
                OrganizeImports = {
                  organize_imports,
                  description = "Organize Imports",
                }
              },
            })
          end,
        },
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
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require('lint').linters_by_ft = {
        javascript = { "eslint" },
        typescript = { "eslint" },
      }

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end
  },
}
