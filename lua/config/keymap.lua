-- save document
vim.keymap.set("n", "<C-s>", vim.cmd.w, { desc = "Save Buffer", silent = true })
vim.keymap.set("i", "<C-s>", vim.cmd.w, { desc = "Save Buffer", silent = true })
vim.keymap.set("v", "<C-s>", vim.cmd.w, { desc = "Save Buffer", silent = true })

vim.keymap.set('i', '<C-Del>', "<Esc>lce")
vim.keymap.set('n', '<C-Del>', "ce")

vim.keymap.set('n', 'Q', ':quitall<CR>', { desc = "Fechar todos", silent = true })

-- Split navigation and management
vim.keymap.set('n', '<C-left>', ':bprev<CR>', { desc = 'Goto Previous Buffer', silent = true })
vim.keymap.set('n', '<C-right>', ':bnext<CR>', { desc = 'Goto Next Buffer', silent = true })
vim.keymap.set('n', '<leader>bd', ':bprev<CR>:bdelete #<CR>', { desc = 'Close Current Buffer' })
vim.keymap.set('n', '<leader>bD', "<cmd>:%bd<CR>", { desc = 'Close All Buffers' })
vim.keymap.set('n', '<leader>bC', "<cmd>%bd|e#|bd#<CR>", { desc = 'Close All Buffers But This' })
vim.keymap.set('n', '<leader>br', "<cmd>:e!<CR>", { desc = 'Reload Buffer' })

-- Reise splits
vim.keymap.set({ 'n', 't' }, '<S-Left>', ':vertical res +1^M<CR>', { silent = true })
vim.keymap.set({ 'n', 't' }, '<S-Right>', ':vertical res -1^M<CR>', { silent = true })
vim.keymap.set({ 'n', 't' }, '<C-Up>', ':resize -1<CR>', { silent = true })
vim.keymap.set({ 'n', 't' }, '<C-Down>', ':resize +1<CR>', { silent = true })

-- Navegar no layout
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>") -- vai para a janela que estiver acima
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>") -- vai para a janela que estiver abaixo
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>") -- vai para a janela que estiver a esquerda
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>") -- vai para a janela que estiver a direita

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

vim.keymap.set('n', 'u', 'undo', { noremap = true, silent = true })
vim.keymap.set('n', '<c-z>', 'undo', { noremap = true, silent = true })

vim.api.nvim_create_user_command('GenerateLaunchJson', function(opts)
  local has_src = opts.fargs[1] == "true"
  local net_version = opts.fargs[2]
  local project_name = opts.fargs[3]
  require('config.utils-dotnet').generate_launch_json(has_src, net_version, project_name)
end, { nargs = '*' })

