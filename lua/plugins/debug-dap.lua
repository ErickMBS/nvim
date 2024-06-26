return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "mxsdev/nvim-dap-vscode-js",
      -- lazy spec to build "microsoft/vscode-js-debug" from source
      {
        "microsoft/vscode-js-debug",
        version = "1.x",
        build = "npm i && npm run compile vsDebugServerBundle && mv dist out"
      }
    },
    config = function()
      local dap = require("dap")

      dap.listeners.before.event_initialized["pre_build"] = function()
        require('config.utils-dotnet').pre_build_command()
      end

      dap.adapters.coreclr = {
        type = "executable",
        command = "/usr/local/bin/netcoredbg/netcoredbg",
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

      require("dap-vscode-js").setup({
        debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
        adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
      })

      for _, language in ipairs({ "typescript", "javascript", "svelte" }) do
        require("dap").configurations[language] = {
          -- attach to a node process that has been started with
          -- `--inspect` for longrunning tasks or `--inspect-brk` for short tasks
          -- npm script -> `node --inspect-brk ./node_modules/.bin/vite dev`
          {
            -- use nvim-dap-vscode-js's pwa-node debug adapter
            type = "pwa-node",
            -- attach to an already running node process with --inspect flag
            -- default port: 9222
            request = "attach",
            -- allows us to pick the process using a picker
            processId = require 'dap.utils'.pick_process,
            -- name of the debug action you have to select for this config
            name = "Attach debugger to existing `node --inspect` process",
            -- for compiled languages like TypeScript or Svelte.js
            sourceMaps = true,
            -- resolve source maps in nested locations while ignoring node_modules
            resolveSourceMapLocations = {
              "${workspaceFolder}/**",
              "!**/node_modules/**" },
            -- path to src in vite based projects (and most other projects as well)
            cwd = "${workspaceFolder}/src",
            -- we don't want to debug code inside node_modules, so skip it!
            skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
          },
          {
            type = "pwa-chrome",
            name = "Launch Chrome to debug client",
            request = "launch",
            url = "http://localhost:5173",
            sourceMaps = true,
            protocol = "inspector",
            port = 9222,
            webRoot = "${workspaceFolder}/src",
            -- skip files from vite's hmr
            skipFiles = { "**/node_modules/**/*", "**/@vite/*", "**/src/client/*", "**/src/*" },
          },
          -- only if language is javascript, offer this debug action
          language == "javascript" and {
            -- use nvim-dap-vscode-js's pwa-node debug adapter
            type = "pwa-node",
            -- launch a new process to attach the debugger to
            request = "launch",
            -- name of the debug action you have to select for this config
            name = "Launch file in new node process",
            -- launch current file
            program = "${file}",
            cwd = "${workspaceFolder}",
          } or nil,
        }
      end

      require("dapui").setup()
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({ reset = true })
      end
      dap.listeners.before.event_terminated["dapui_config"] = dapui.close
      dap.listeners.before.event_exited["dapui_config"] = dapui.close


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
        "<leader>sb",
        '<Cmd>lua require("dap").toggle_breakpoint()<CR>',
        { noremap = true, silent = true, desc = "Breakpoint" }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>sB",
        '<Cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
        { noremap = true, silent = true, desc = "Conditional Breakpoint" }
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
