return {
  -- status bar
  'tamton-aquib/staline.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- Statusline setup
    require('staline').setup {
      defaults = {
        mod_symbol      = "",     -- Disable anoying symbols
        left_separator  = "",
        right_separator = "",
        true_colors     = true,     -- True lsp colors.
        branch_symbol   = " "
      },

      mode_colors = {     -- Colors for each mode
        n = "#4799eb",
        i = "#e0af68",
        c = "#bb9af7",
        v = "#9ece6a",
        V = "#7dcfff"
      },
      mode_icons = {     -- Sets the names for the different modes
        n = "Nor",
        i = "Ins",
        c = "Cmd",
        v = "Vis",
        V = "Vis.L"
      },
      sections = {     -- Sections where each element of the statusline livessta
        left  = { '-mode', 'file_name', 'file_size', ' ', 'lsp' },
        mid   = { 'cwd' },
        right = { 'line_column', 'branch' }
      },
      lsp_symbols = {     -- Icons for LSP diagnostics
        Error = " ",
        Info = " ",
        Warn = " ",
        Hint = " "
      }
    }
  end,
}
