return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      size = 8,
      direction = 'horizontal'
    })
    vim.keymap.set('n', '<leader>te', ':ToggleTerm size=8<CR>', {})
  end
}
