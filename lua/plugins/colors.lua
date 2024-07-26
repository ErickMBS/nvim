return {
  -- Gosto de temas dark que diferenciem os tipos, textos e palavras reservadas...
  -- Themas que mais gostei:
  -- edge
  -- lunar
  -- vscode
  -- duskfox
  -- nordfox
  -- onedark / onedarker
  -- nightfox
  -- retrobox
  -- monokai (todos)
  -- tokyonight-moon
  -- catppuccin-frappe
  {
    "catppuccin/nvim",
    -- event = "VeryLazy",
    cmd = "LoadColors",
    name = "catppuccin",
    -- priority = 1000,
    -- config = function()
    -- 	vim.cmd.colorscheme "catppuccin"
    -- end
  },
  {
    "EdenEast/nightfox.nvim",
    -- priority = 1000,
    -- event = "VeryLazy",
    cmd = "LoadColors",
    -- config = function()
    -- 	vim.cmd.colorscheme "nightfox"
    -- end
  },
  {
    'rose-pine/neovim',
    -- event = "VeryLazy",
    cmd = "LoadColors",
    -- config = function()
    -- 	vim.cmd.colorscheme "rose-pine-moon"
    -- end
  },
  {
    'LunarVim/lunar.nvim',
    -- event = "VeryLazy",
    --config = function()
    --  vim.cmd.colorscheme "lunar"
    -- vim.api.nvim_create_user_command( 'LoadColors', function(opts) end, {})
    --end
  },
  {
    "lunarvim/Onedarker.nvim",
    -- event = "VeryLazy",
    cmd = "LoadColors",
  },
  {
    "navarasu/onedark.nvim",
    -- event = "VeryLazy",
    cmd = "LoadColors",
    -- config = function ()
    -- require("onedark").setup({
    -- style = "dark"
    -- })
    -- require('onedark').load()
    -- vim.cmd.colorscheme "onedark"
    -- end
  },
  {
    "rebelot/kanagawa.nvim",
    -- event = "VeryLazy",
    cmd = "LoadColors",
  },
  {
    'folke/tokyonight.nvim',
    -- event = "VeryLazy",
    cmd = "LoadColors",
  },
  {
    'Everblush/nvim',
    -- event = "VeryLazy",
    cmd = "LoadColors",
  },
  {
    'sainnhe/edge',
    -- event = "VeryLazy",
    cmd = "LoadColors",
  },
  {
    'Mofiqul/vscode.nvim',
    -- event = "VeryLazy",
    cmd = "LoadColors",
  },
  {
    'JoosepAlviste/palenightfall.nvim',
    -- event = "VeryLazy",
    cmd = "LoadColors",
  },
  {
    'stevedylandev/flexoki-nvim',
    -- event = "VeryLazy",
    cmd = "LoadColors",
  },
  {
    'samharju/synthweave.nvim',
    -- event = "VeryLazy",
    cmd = "LoadColors",
  },
  {
    'maxmx03/fluoromachine.nvim',
    -- event = "VeryLazy",
    cmd = "LoadColors",
  },
  {
    'artanikin/vim-synthwave84',
    -- event = "VeryLazy",
    cmd = "LoadColors",
  },
  {
    'loctvl842/monokai-pro.nvim',
    -- event = "VeryLazy",
    -- cmd = "LoadColors",
    config = function()
      require("monokai-pro").setup({
        -- ... your config
      })
      -- lua
      -- vim.cmd([[colorscheme monokai-pro]])
    end
  },
  {
    'uloco/bluloco.nvim',
    lazy = false,
    priority = 1000,
    dependencies = { 'rktjmp/lush.nvim' },
    config = function()
      require('bluloco').setup({
        style       = "auto", -- "auto" | "dark" | "light"
        transparent = true,
        italics     = false,
        terminal    = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
        guicursor   = true,
      })

      vim.opt.termguicolors = true
      vim.cmd([[colorscheme bluloco]])
    end
  }
}
