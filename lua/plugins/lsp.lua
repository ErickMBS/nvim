return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { 'onsails/lspkind.nvim' },
    },
    config = function()
      require("lspconfig").csharp_ls.setup({
        settings = {
          csharp = {
            autoInsertUsings = true,
          },
        },
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
          buf_set_keymap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
          buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
          buf_set_keymap(bufnr, 'n', '<leader>k', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        end,
      })

      local lspconfig = require('lspconfig')

      -- lua setup
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })

      -- ts setup
      local function organize_imports()
        local params = {
          command = "_typescript.organizeImports",
          arguments = { vim.api.nvim_buf_get_name(0) },
        }
        vim.lsp.buf.execute_command(params)
      end

      lspconfig.tsserver.setup({
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
        on_attach = function(client, bufnr)
          local buf_set_keymap = vim.api.nvim_buf_set_keymap
          local opts = { noremap = true, silent = true }
          -- Mapeamentos adicionais similares ao VSCode
          buf_set_keymap(bufnr, 'n', '<F12>', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
          buf_set_keymap(bufnr, 'i', '<F12>', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
          buf_set_keymap(bufnr, 'n', '<leader><F12>', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
          buf_set_keymap(bufnr, 'n', '<leader>.', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
          buf_set_keymap(bufnr, 'i', '>.', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
          buf_set_keymap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
          buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
          buf_set_keymap(bufnr, 'n', '<leader>k', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        end,
      })

      lspconfig.angularls.setup({
        cmd = { "ngserver", "--stdio" },
        on_new_config = function(new_config, new_root_dir)
          new_config.cmd = { "ngserver", "--stdio", "--tsProbeLocations", new_root_dir, "--ngProbeLocations",
            new_root_dir }
        end,
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
          debounce_text_changes = 150,
        },
        root_dir = require 'lspconfig'.util.root_pattern('angular.json', 'project.json')
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
    event = "VeryLazy",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "csharp_ls",
          "lua_ls",
          "tsserver",
          "eslint",
          "angularls",
          -- "coreclr",
          -- "prettier",
          -- "js-debug-adapter",
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
