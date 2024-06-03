return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "rcarriga/nvim-dap-ui",
    "ldelossa/nvim-dap-projects",
  },
  config = function()
    local dap, dapui = require("dap"), require("dapui")

    dapui.setup({
      icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
      mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
      },
      element_mappings = {},
      expand_lines = vim.fn.has("nvim-0.7") == 1,
      layouts = {
        {
          elements = {
            { id = "scopes", size = 0.25 },
            "breakpoints",
            "stacks",
            "watches",
          },
          size = 40, -- 40 columns
          position = "left",
        },
        {
          elements = {
            "repl",
            "console",
          },
          size = 0.25, -- 25% of total lines
          position = "bottom",
        },
      },
      controls = {
        enabled = true,
        element = "repl",
        icons = {
          pause = "",
          play = "",
          step_into = "",
          step_over = "",
          step_out = "",
          step_back = "",
          run_last = "↻",
          terminate = "□",
        },
      },
      floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
      windows = { indent = 1 },
      render = {
        max_type_length = nil, -- Can be integer or nil.
        max_value_lines = 100, -- Can be integer or nil.
      },
    })

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    dap.adapters.coreclr = {
      type = "executable",
      command = "/usr/local/bin/netcoredbg/netcoredbg",
      args = { "--interpreter=vscode" },
    }

    dap.configurations.cs = {
      {
        type = "coreclr",
        name = "launch - Cudle.Api",
        request = "launch",
        program = function()
          return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/src/Cudle.Api/bin/Debug/net8.0/Cudle.Api", "file")
        end,
      },
      {
        type = "coreclr",
        name = "attach - netcoredbg",
        request = "attach",
        processId = function ()
          return vim.fn.input('Process Id')
        end,
      },
      {
        type = "coreclr",
        name = "launch - console-teste",
        request = "launch",
        program = function()
          return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/console-teste/bin/Debug/net8.0/console-teste", "file")
        end,
      },
    }

    vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
    vim.keymap.set("n", "<Leader>dc", dap.continue, {})
    vim.keymap.set("n", "<F5>", '<Cmd>lua require"dap".continue()<CR>', { silent = true })
    vim.keymap.set("n", "<F10>", '<Cmd>lua require"dap".step_over()<CR>', { silent = true })
    vim.keymap.set("n", "<F11>", '<Cmd>lua require"dap".step_into()<CR>', { silent = true })
    vim.keymap.set("n", "<F12>", '<Cmd>lua require"dap".step_out()<CR>', { silent = true })
    vim.keymap.set("n", "<Leader>b", '<Cmd>lua require"dap".toggle_breakpoint()<CR>', { silent = true })
    vim.keymap.set(
      "n",
      "<Leader>B",
      '<Cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
      { silent = true }
    )
    vim.keymap.set(
      "n",
      "<Leader>lp",
      '<Cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',
      { silent = true }
    )
    vim.keymap.set("n", "<Leader>dr", dap.repl.open, { silent = true })
    vim.keymap.set("n", "<Leader>dl", dap.run_last, { silent = true })
  end,
}
