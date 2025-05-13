do
  vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*.scm",
    callback = function()
      vim.opt.filetype = "scheme.guile"
    end,
  })

  local __lspServers = {
    { name = "zls" },
    { name = "yamlls" },
    { name = "terraformls" },
    { name = "slint_lsp" },
    { name = "pyright" },
    { name = "nil_ls" },
    { name = "marksman" },
    { name = "lua_ls" },
    { name = "gopls" },
    { name = "dartls" },
    { name = "cmake" },
    { name = "clangd" },
    { name = "hls" },
    { name = "rust_analyzer" },
    { name = "eslint" },
    { name = "ts_ls" },
    { name = "tinymist" },
    { name = "dockerls" },
    { name = "dts_lsp" },
    { name = "guile_ls" },
    { name = "qmlls",        options = { cmd = { "qmlls6" } }, },
    { name = "dprint" },
  }
  -- Adding lspOnAttach function to nixvim module lua table so other plugins can hook into it.
  local lspOnAttach = function(client, bufnr)
    -- require("lsp-format").on_attach(client)
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
  local __lspCapabilities = function()
    capabilities = vim.lsp.protocol.make_client_capabilities()

    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

    return capabilities
  end

  local __setup = {
    on_attach = lspOnAttach,
    capabilities = __lspCapabilities(),
  }

  for i, server in ipairs(__lspServers) do
    if type(server) == "string" then
      require("lspconfig")[server].setup(__setup)
    else
      local options = server.extraOptions

      if options == nil then
        options = __setup
      else
        options = vim.tbl_extend("keep", options, __setup)
      end

      require("lspconfig")[server.name].setup(options)
    end
  end
end
