local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.completion.spell,
    null_ls.builtins.formatting.prettier,
  },
})

vim.keymap.set("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format()<cr>", { silent = true, desc = "Format code" })
