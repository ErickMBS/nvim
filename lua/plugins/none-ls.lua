return {
  {
    "nvimtools/none-ls.nvim",
    lazy = true,
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.pyink,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.csharpier.with({
            filetypes = { "cs" }
          }),
        },
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.cs",
        callback = function()
          vim.lsp.buf.format()
        end,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.ts",
        callback = function()
          vim.lsp.buf.format()
        end,
      })

      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
  },
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require('mason-null-ls').setup({
				automatic_setup = true
			})
		end,
	},
}
