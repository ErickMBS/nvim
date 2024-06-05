return {
	{
		'MoaidHathot/dotnet.nvim',
		-- cmd = "DotnetUI",
	keys = {
		{ '<leader>/', mode = { 'n', 'v' } },
		{ '<leader>.a', "<cmd>:DotnetUI new_item<CR>", { desc = '.NET new item', silent = true} },
		{ '<leader>.b', "<cmd>:DotnetUI file bootstrap<CR>", { desc = '.NET bootstrap class', silent = true} },
		{ '<leader>.ra', "<cmd>:DotnetUI project reference add<CR>", { desc = '.NET add project reference', silent = true} },
		{ '<leader>.rr', "<cmd>:DotnetUI project reference remove<CR>", { desc = '.NET remove project reference', silent = true} },
		{ '<leader>npa', "<cmd>:DotnetUI project package add<CR>", { desc = '.NET ada project package', silent = true} },
		{ '<leader>npj', "<cmd>:DotnetUI project package remove<CR>", { desc = '.NET remove project package', silent = true} },
	},
	opts = {},
	}
}
