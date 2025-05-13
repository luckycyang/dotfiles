require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    -- python = { "isort", "black" },
    -- You can customize some of the format options for the filetype (:help conform.format)
    rust = { "rustfmt", lsp_format = "fallback" },
    -- Conform will run the first available formatter
    javascript = { "prettier", stop_after_first = true },
    -- Nix my as develop tool
    nix = { "alejandra" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    haskell = { "hindent" },
    typst = { "typstyle" },
  },
  formatters = {
    json = {
      command = "dprint",
      args = { "fmt" },
    },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})
