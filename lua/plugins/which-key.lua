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
      wk.add({
        { "<leader>a", group = "Code Actions" },
        { "<leader>b", group = "Buffers" },
        { "<leader>d", group = "Dap" },
        { "<leader>f", group = "Fing / Grep" },
        { "<leader>g", group = "Format Lint" },
        { "<leader>l", group = "Underline Diagnostics" },
        { "<leader>m", group = "Oil" },
        { "<leader>n", group = "DotNet" },
        { "<leader>p", group = "Code Previews" },
        { "<leader>s", group = "Breakpoints" },
        { "<leader>t", group = "Terminal" },
        { "<leader>x", group = "Throuble Diagnostics" },
      })
    end
  },
}
