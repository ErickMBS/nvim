return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			dap.adapters.coreclr = {
				type = "executable",
				command = "netcoredbg",
				args = { "--interpreter=vscode" },
			}
			dap.configurations.cs = {
				{
					type = "coreclr",
					name = "Launch",
					request = "launch",
					program = function()
						-- return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
						return vim.fn.input("Path to dll: ", vim.fn.getcwd(), "file")
					end,
				},
			}

			-- Keybindings para DAP
			vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
			vim.api.nvim_set_keymap(
				"n",
				"<F5>",
				'<Cmd>lua require("dap").continue()<CR>',
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<F10>",
				'<Cmd>lua require("dap").step_over()<CR>',
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<F11>",
				'<Cmd>lua require("dap").step_into()<CR>',
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<F12>",
				'<Cmd>lua require("dap").step_out()<CR>',
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>b",
				'<Cmd>lua require("dap").toggle_breakpoint()<CR>',
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>B",
				'<Cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>dr",
				'<Cmd>lua require("dap").repl.open()<CR>',
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>dl",
				'<Cmd>lua require("dap").run_last()<CR>',
				{ noremap = true, silent = true }
			)
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		requires = { "mfussenegger/nvim-dap" },
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			require("dapui").setup()
			local dap, dapui = require("dap"), require("dapui")
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"jayp0521/mason-nvim-dap.nvim",
		requires = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = { "netcoredbg" },
			})
		end,
	},
}
