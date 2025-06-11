return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    require("dapui").setup()
    vim.keymap.set(
      "n",
      "<leader>dd",
      function()
        require("dapui").open() -- 需要 nvim-dap-ui
        vim.cmd [[DapContinue]] -- 重要：这会延迟加载 nvim-dap
      end, { desc = "Open Dap-ui" }
    )
  end,
}
