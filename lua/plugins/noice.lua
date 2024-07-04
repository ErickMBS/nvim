return {
  -- PRETTY COMMANDLINE
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = { 'MunifTanjim/nui.nvim' },
  opts = {
    lsp = {
      progress = { enabled = false },
      hover = { enabled = false },
      signature = { enabled = false },
    },

    -- enable preset configs
    presets = {
      bottom_search = true,             -- use a classic bottom cmdline for search
      command_palette = true,           -- position the cmdline and popupmenu together
      long_message_to_split = true,     -- long messages will be sent to a split
      inc_rename = false,               -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false            -- add a border to hover docs and signature help
    }
  }
}

