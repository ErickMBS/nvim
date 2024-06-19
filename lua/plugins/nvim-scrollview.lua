return {
  {
    "dstein64/nvim-scrollview",
    config = function ()
      require("scrollview").setup({
        signs_on_startup = {'all'},
        diagnostics_severities = {vim.diagnostic.severity.ERROR}
      })
    end
  }
}
