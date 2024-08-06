return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "Issafalcon/neotest-dotnet",
      "nvim-treesitter/nvim-treesitter"
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-dotnet")({
            dap = {
              args = { justMyCode = true },
              adapter_name = "netcoredbg",
            },
          })
        }
      })
    end,
  },
}
