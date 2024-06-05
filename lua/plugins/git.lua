return {
  -- estou usando para fazer o blame (mostrar na linha quem editou e quando)
  'lewis6991/gitsigns.nvim',
  cmd = "Gitsigns",
  config = function()
    require('gitsigns').setup({
      current_line_blame = true,
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
      current_line_blame_formatter_opts = {
        relative_time = false
      }
    })
  end
}
