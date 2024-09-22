return {
  -- Pretty notifications
  'rcarriga/nvim-notify',
  event = "VeryLazy",
  config = function()
    require('notify').setup({
      background_colour = "#000000",
      max_width = 50,
    })
  end
}
