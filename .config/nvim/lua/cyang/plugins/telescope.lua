return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local is_ok, builtin = pcall(require, "telescope.builtin")
    if not is_ok then
      return
    end

    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = 'find_files' })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = 'live_grep' })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = 'find buffers' })
    vim.keymap.set('n', '<leader>e', builtin.diagnostics, { desc = "Diagnostics" })
    vim.keymap.set('n', '<leader>t', builtin.builtin, { desc = "Telescope" })
    vim.keymap.set('n', '<leader>gg', "<cmd>LazyGit<cr>", { desc = "Lazy Git" })




  end
}
