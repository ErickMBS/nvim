return {
  -- IA codeium autocomplete
  {
    "Exafunction/codeium.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    lazy = false,
    event = 'BufEnter',
    config = function()
      require("codeium").setup({
      })
    end
  }
}
