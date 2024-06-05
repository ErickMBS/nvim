return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      vim.keymap.set('n', '<leader>n', ':Neotree reveal toggle<CR>', {})
      vim.keymap.set('n', '<C-b>', ':Neotree reveal toggle<CR>', {})
      require("neo-tree").setup({
        window = {
          width = 30
        }
      })
    end
  },
}
