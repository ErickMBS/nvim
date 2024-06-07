return {
  {
    -- estou usando para fazer o blame (mostrar na linha quem editou e quando)
    'lewis6991/gitsigns.nvim',
    cmd = "Gitsigns",
    config = function()
      local status_ok, gitsigns = pcall(require, "gitsigns")
      if not status_ok then
        return
      end

      require('gitsigns').setup({
        auto_attach = true,
        current_line_blame = true,
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        current_line_blame_formatter_opts = {
          relative_time = false
        },
        sign_priority = 6,
      })
    end
  },
}
