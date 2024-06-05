return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    config = function()
      local wk = require("which-key")
      wk.register({
        ["<leader>"] = {
          a = {
            name = "+Code Actions"
          },
          b = {
            name = "+Buffers"
          },
          d = {
            name = "+Dap"
          },
          f = {
            name = "+Fing / Grep"
          },
          g = {
            name = "+Format Lint"
          },
          l = {
            name = "+Underline Diagnostics"
          },
          m = {
            name = "+Oil"
          },
          n = {
            name = "+DotNet"
          },
          p = {
            name = "+Code Previews"
          },
          s = {
            name = "+Breakpoints"
          },
          t = {
            name = "+Terminal"
          },
          x = {
            name = "+Throuble Diagnostics"
          }
        }
      })
    end
  },
}
