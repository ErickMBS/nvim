return {
  {
    -- útil para marcações e navegação
    -- Modo de uso:
    --
    -- m<letra>         ->  Cria uma marcação letra
    -- dm<letra>        ->  Remove uma marcação letra
    -- m]               ->  Move para a próxima marca
    -- m[               ->  Move para a marca anterior
    --
    -- m[0-9]           -> Cria um grupo de bookmark
    -- dm[0-9]          -> Remove todos os bookmarks do mesmo grupo
    -- m}               -> Move para o próximo bookmark do mesmo tipo
    -- m{               -> Move para o bookmark anterior do mesmo tipo
    -- dm=              -> deleta o bookmark da linha que está o cursor
    'chentoast/marks.nvim',
    event = "VeryLazy",
    config = function()
      require('marks').setup({})
    end
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({
        toggler = {
          line = 'gcc',
          block = 'gbc',
        },
        opleader = {
          line = 'gc',
          block = 'gb',
        },
        mappings = {
          basic = true,
          extra = true,
        },
      })

      -- Mapeamento no modo normal para 'Ctrl + k, Ctrl + c'
      vim.api.nvim_set_keymap('n', '<C-\\>', '<Esc>gcc', { noremap = false })
      vim.api.nvim_set_keymap('i', '<C-\\>', '<Esc>gcc', { noremap = false })
      -- Mapeamento no modo visual para 'Ctrl + k, Ctrl + c'
      vim.api.nvim_set_keymap('v', '<C-k><C-c>', 'gc', { noremap = false, silent = true })
    end
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
          ensure_installed = {
            "c",
            "lua",
            "vim",
            "vimdoc",
            "query",
            "elixir",
            "heex",
            "javascript",
            "html",
            "json",
            "c_sharp",
            "python",
            "markdown",
            "markdown_inline",
            "tsx",
            "typescript",
          },
          autotag = {
            enable = true,
          },
          auto_instal = true,
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
          textobjects = {
            move = {
              ehnable = true,
              set_jumps = true,
              goto_next_start = {
                ["]m"] = "@function.outer",
                ["]c"] = "@class.outer",
              },
              -- goto next end
              goto_next_end = {
                ["]M"] = "@function.outer",
                ["]C"] = "@class.outer",
              },
            },
            select = {
              enable = true,
              lookahead = true,
              keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["am"] = "@function.outer",
                ["im"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                ["ib"] = "@block.inner",
                ["ab"] = "@block.outer",
                ["iP"] = "@parameter.inner",
                ["aP"] = "@parameter.outer",
              },
            },
          },
        }
      })
    end
  },
  {
    "kevinhwang91/nvim-ufo",
    event = "BufRead",
    dependencies = {
      { "kevinhwang91/promise-async" },
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          local builtin = require("statuscol.builtin")
          require("statuscol").setup({
            -- foldfunc = "builtin",
            -- setopt = true,
            relculright = true,
            segments = {
              { text = { builtin.foldfunc },      click = "v:lua.ScFa" },
              { text = { "%s" },                  click = "v:lua.ScSa" },
              { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            },
          })
        end,
      },
    },
    config = function()
      -- Fold options
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
      vim.o.foldcolumn = "1" -- '0' is not bad
      vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      require("ufo").setup()
    end,
  },
}
