return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")

    --
    vim.fn.sign_define('DapBreakpoint',
      { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
    vim.fn.sign_define('DapBreakpointCondition',
      { text = 'ﳁ', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
    vim.fn.sign_define('DapBreakpointRejected',
      { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
    vim.fn.sign_define('DapLogPoint',
      { text = '', texthl = 'DapLogPoint', linehl = 'DapLogPoint', numhl = 'DapLogPoint' })
    vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })

    -- Keymappings for DAP
    vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
    vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP: Continue" })
    vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "DAP: Step Over" })
    vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "DAP: Step Into" })
    vim.keymap.set("n", "<leader>du", dap.step_out, { desc = "DAP: Step Out" })
    vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "DAP: Open REPL" })
    vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "DAP: Terminate" })
    vim.keymap.set("n", "<leader>dl", function()
      require("dap").run_last()
    end, { desc = "DAP: Run Last" })
    vim.keymap.set("n", "<Leader>dp", function()
      require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
    end)

    dap.adapters = {
      codelldb = require('config.mise.dap.adapter.codelldb')
    }
    dap.configurations = {
      rust = require("config.mise.dap.configuration.cpp"),
      cpp = require("config.mise.dap.configuration.cpp"),
      c = require("config.mise.dap.configuration.cpp"),
    }
  end,
}
