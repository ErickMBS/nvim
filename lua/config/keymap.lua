-- save document
vim.keymap.set("n", "<C-s>", vim.cmd.w, { desc = "Save Buffer", silent = true })
vim.keymap.set("i", "<C-s>", vim.cmd.w, { desc = "Save Buffer", silent = true })
vim.keymap.set("v", "<C-s>", vim.cmd.w, { desc = "Save Buffer", silent = true })

vim.keymap.set('i', '<C-Del>', "<Esc>lce")
vim.keymap.set('n', '<C-Del>', "ce")

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


