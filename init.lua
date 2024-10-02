local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("config.vim-options")
require("config.keymap")
require("config.autocmds")
vim.opt.termguicolors = true

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  install = { colorscheme = { "onedarker", "nightfox", "habamax" } },
  change_detection = {
    notify = false
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "man",
        "rplugin",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  }
})

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimLoaded",
  callback = function()
    vim.keymap.set('n', 'u', 'undo', { noremap = true, silent = true })
  end,
})

