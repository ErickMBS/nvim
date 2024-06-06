return {
  -- Terminal Integrado
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      size = 20,
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = 'horizontal', -- pode ser 'vertical' ou 'float'
      close_on_exit = true,
      shell = vim.o.shell,
      -- Esta função é chamada quando o terminal é aberto
      on_open = function(term)
        vim.api.nvim_buf_set_keymap(term.bufnr, 't', '<C-\\><C-n>', [[<C-\><C-n>]], { noremap = true, silent = true })
      end,
    })
    vim.keymap.set('n', '<leader>te', ':ToggleTerm size=8<CR>', {})
    vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], {noremap = true, silent = true})
  end
}
