return {
  {
    "ojroques/vim-oscyank",
    config = function()
      vim.api.nvim_set_keymap("n", "<leader>y", ":OSCYankVisual<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("v", "<leader>y", ":OSCYankVisual<CR>", { noremap = true, silent = true })
    end,
  },
}
