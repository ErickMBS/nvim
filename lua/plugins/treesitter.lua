return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local status, treesiter = pcall(require, "nvim-treesitter.configs")
    if not status then
      return
    end

    require('nvim-ts-autotag').setup({
      enable_close = true,
      enable_rename = true,
      enable_close_on_slash = false,
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "elixir",
        "heex",
        "javascript",
        "html",
        "json",
        "c_sharp",
        "python",
      },
      autotag = {
        enable = true,
      },
      auto_instal = true,
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      textobjects = {
        move = {
          ehnable = true,
          set_jumps = true,
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]c"] = "@class.outer",
          },
          -- goto next end
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]C"] = "@class.outer",
          },
        },
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["am"] = "@function.outer",
            ["im"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
            ["ib"] = "@block.inner",
            ["ab"] = "@block.outer",
            ["iP"] = "@parameter.inner",
            ["aP"] = "@parameter.outer",
          },
        },
      },
    })
  end,
}
