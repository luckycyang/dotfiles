-- Set different settings for different languages' LSP.
-- LSP list: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- How to use setup({}): https://github.com/neovim/nvim-lspconfig/wiki/Understanding-setup-%7B%7D
--     - the settings table is sent to the LSP.
--     - on_attach: a lua callback function to run after LSP attaches to a given buffer.
local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")
local util = require("lspconfig.util")
-- Customized on_attach function.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions.
local function opts_with_desc(desc)
  return { noremap = true, silent = true, desc = desc }
end
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts_with_desc("Open Float"))
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts_with_desc("Goto prev"))
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts_with_desc("Goto next"))
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts_with_desc("Setloclist"))

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer.
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  if client.name == "rust_analyzer" then
    -- WARNING: This feature requires Neovim 0.10 or later.
    vim.lsp.inlay_hint.enable()
  end

  local function kopts(desc)
    return { noremap = true, silent = true, buffer = bufnr, desc = desc }
  end
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, kopts("Go to declaration"))
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, kopts("Go to definition"))
  vim.keymap.set("n", "K", vim.lsp.buf.hover, kopts("Lsp hover info"))
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, kopts("Go to impl"))
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, kopts("Sigh help"))
  vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, kopts("Add workspace folder"))
  vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, kopts("Remove workspace folder"))
  vim.keymap.set("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, kopts("List workspace folder"))
  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, kopts("Type definition"))
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, kopts("Rename"))
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, kopts("Code action"))
  vim.keymap.set("n", "gr", vim.lsp.buf.references, kopts("References"))
end

-- How to add an LSP for a specific programming language?
-- 1. Use `:Mason` to install the corresponding LSP.
-- 2. Add the configuration below. The syntax is `lspconfig.<name>.setup(...)`
-- Hint (find <name> here) : https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

lspconfig.pylsp.setup({
  on_attach = on_attach,
})

lspconfig.gopls.setup({
  on_attach = on_attach,
})

lspconfig.lua_ls.setup({
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim).
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global.
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files.
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier.
      telemetry = {
        enable = false,
      },
    },
  },
})

lspconfig.bashls.setup({ on_attach = on_attach })

lspconfig.rust_analyzer.setup({
  -- source: https://rust-analyzer.github.io/manual.html#nvim-lsp
  on_attach = on_attach,
})

lspconfig.clangd.setup({
  on_attach = on_attach,
})

lspconfig.ocamllsp.setup({
  on_attach = on_attach,
})

-- Case 1. For CMake Users
--     $ cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON .
-- Case 2. For Bazel Users, use https://github.com/hedronvision/bazel-compile-commands-extractor
-- Case 3. If you don't use any build tool and all files in a project use the same build flags
--     Place your compiler flags in the compile_flags.txt file, located in the root directory
--     of your project. Each line in the file should contain a single compiler flag.
-- src: https://clangd.llvm.org/installation#compile_commandsjson
lspconfig.clangd.setup({
  on_attach = on_attach,
})
lspconfig.cmake.setup({})

lspconfig.hls.setup({
  on_attach = on_attach,
})

-- some thing command like yaml
lspconfig.dprint.setup({
  on_attach = on_attach,
})

-- Zig lang
lspconfig.zls.setup({ on_attach = on_attach })

-- fish
lspconfig.fish_lsp.setup({ on_attach = on_attach })

-- nix
lspconfig.nil_ls.setup({ on_attach = on_attach })

-- typst
lspconfig.tinymist.setup({
  offset_encoding = "utf-8",
  on_attach = on_attach,
})

-- csharp
lspconfig.csharp_ls.setup({ on_attach = on_attach })

if not configs.cangjie then
  configs.cangjie = {
    default_config = {
      cmd = {
        "LSPServer",
      },
      filetypes = { "cangjie" },
      root_dir = util.root_pattern("cjpm.toml"),
      settings = {},
    },
  }
end

-- For Scala
lspconfig.metals.setup({
  on_attach = on_attach,
})


