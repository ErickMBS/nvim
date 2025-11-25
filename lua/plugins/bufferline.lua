return
{
  {
    'akinsho/bufferline.nvim',
    enabled = false,
    -- event = "VeryLazy",
    event = { "BufReadPre", "BufNewFile" },
    -- tag = "*",
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    -- lazy = false,
    config = function()
      local bufferline = require('bufferline')

      vim.keymap.set('n', '<leader>bf', "<cmd>:BufferLinePick<CR>", { desc = 'Pick Buffer' })
      vim.keymap.set('n', '<leader>bs', "<cmd>:BufferLinePick<CR>", { desc = 'Pick Buffer' })
      vim.keymap.set('n', '<leader>bp', "<cmd>:BufferLineTogglePin<CR>", { desc = 'Pin Buffer' })

      bufferline.setup {
        options = {
          mode = 'buffers',
          offsets = {
            {
              filetype = "neo-tree",
              text = 'File Explorer',
              highlight = 'Directory',
              separator = true,
            }
          }
        }
      }
    end
  },
  {
    'romgrk/barbar.nvim',
    enabled = true,
    dependencies = {
      'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
      vim.keymap.set('n', '<leader>bs', "<cmd>:BufferPick<CR>", { desc = 'Pick Buffer' })
      vim.keymap.set('n', '<leader>bp', "<cmd>:BufferPin<CR>", { desc = 'Pin Buffer' })

      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }

      -- Move to previous/next
      map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
      map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
      -- Re-order to previous/next
      map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
      map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
      -- Goto buffer in position...
      map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
      map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
      map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
      map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
      map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
      map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
      map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
      map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
      map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
      map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
      -- Pin/unpin buffer
      map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
      -- Goto pinned/unpinned buffer
      --                 :BufferGotoPinned
      --                 :BufferGotoUnpinned
      -- Close buffer
      map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
    end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
  }
}
