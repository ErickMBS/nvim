return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local status, treesiter = pcall(require, "nvim-treesitter.configs")
    if not status then
      return
    end
  end,
}
