return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function() 
    require("bufferline").setup({})
    vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })
    vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
    vim.keymap.set("n", "<S-q>", "<cmd>BufferLineCloseLeft<cr>", { desc = "Close left buffer" })
    vim.keymap.set("n", "<S-w>", "<cmd>BufferLineCloseOthers<cr>", { desc = "Close other buffer" })
    vim.keymap.set("n", "<S-e>", "<cmd>BufferLineCloseRight<cr>", { desc = "Close right buffer" })

  -- local wk = require("which-key")
  -- wk.register({
  -- 	b = {
  -- 		name = "buffer",
  -- 		h = { "<cmd>BufferLineCyclePrev<cr>", "Previous buffer" },
  -- 		l = { "<cmd>BufferLineCycleNext<cr>", "Next buffer" },
  -- 		q = { "<cmd>BufferLineCloseLeft<cr>", "Close left buffer" },
  -- 		w = { "<cmd>BufferLineCloseOthers<cr>", "Close other buffer" },
  -- 		e = { "<cmd>BufferLineCloseRight<cr>", "Close right buffer" },
  -- 	},
  -- }, { prefix = "<leader>" })
  end
}
