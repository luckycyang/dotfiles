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
        require("dapui").toggle() -- 需要 nvim-dap-ui
      end, { desc = "Toggle Dap-ui" }
    )
  end,
}
