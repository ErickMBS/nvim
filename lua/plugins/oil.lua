return {
  -- é um menu de arquivos recentes
  "stevearc/oil.nvim",
  keys = {
    { "<leader>mF", "<CMD>Oil<CR>", { desc = "Open Oil file manager" } },
  },
  opts = {
    default_file_explorer = false,
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
