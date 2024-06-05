return {
	{
		"williamboman/mason.nvim",
		lazy = true,
		config = function()
			require('mason').setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = true,
		dependencies = {
			"williamboman/mason.nvim"
		},
		opts = {
			auto_install = true,
		},
		config = function()
			require('mason-lspconfig').setup({
				ensure_installed = { "lua_ls", "omnisharp" }
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			local lspconfig = require('lspconfig')

			lspconfig.lua_ls.setup({
				capabilities = capabilities
			})

			lspconfig.omnisharp.setup({
				capabilities = capabilities,
				enable_roslyn_analysers = true,
				enable_import_completion = true,
				organize_imports_on_format = true,
				enable_decompilation_support = true,
				filetypes = { 'cs', 'vb', 'csproj', 'sln', 'slnx', 'props', 'csx', 'targets' }
			})

			lspconfig.powershell_es.setup({
				capabilities = capabilities,
				bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services",
				init_options = {
					enableProfileLoading = false,
				}
			})

			lspconfig.pylsp.setup({
				capabilities = capabilities,
			})

			lspconfig.yamlls.setup({
				capabilities = capabilities
			})

			lspconfig.bufls.setup({
				capabilities = capabilities
			})

			lspconfig.bicep.setup({
				capabilities = capabilities
			})

			lspconfig.lemminx.setup({
				capabilities = capabilities
			})

			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
		end
	},
	{
		'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
		event = "VeryLazy",
		config = function()
			require('lsp_lines').setup()

			vim.diagnostic.config({
				virtual_lines = false,
				virtual_text = true,
			})

			local function toggleLines()
				local new_value = not vim.diagnostic.config().virtual_lines
				vim.diagnostic.config({ virtual_lines = new_value, virtual_text = not new_value })
				return new_value
			end

			vim.keymap.set('n', '<leader>lu', toggleLines, { desc = "Toggle Underline Diagnostics", silent = true })
		end
	}
}
