return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-live-grep-args.nvim',
        version = "^1.0.0",
      },
    },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<C-p>', builtin.find_files, {})
      -- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      local telescope = require("telescope")
      telescope.load_extension("live_grep_args")
      vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  },
}
