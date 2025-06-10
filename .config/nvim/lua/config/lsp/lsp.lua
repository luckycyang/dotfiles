return {
  'neovim/nvim-lspconfig',
  dependencies = { 'saghen/blink.cmp' },

  -- example using `opts` for defining servers
  opts = {
    servers = {
      zls           = {},
      yamlls        = {},
      terraformls   = {},
      slint_lsp     = {},
      pyright       = {},
      nil_ls        = {},
      marksman      = {},
      lua_ls        = {},
      gopls         = {},
      dartls        = {},
      cmake         = {},
      clangd        = {},
      hls           = {},
      rust_analyzer = {},
      eslint        = {},
      ts_ls         = {},
      tinymist      = {},
      dockerls      = {},
      dts_lsp       = {},
      guile_ls      = {},
      qmlls         = { cmd = "qmlls6" },
      dprint        = {},
    }
  },
  config = function(_, opts)
    local lspconfig = require('lspconfig')
    for server, config in pairs(opts.servers) do
      -- passing config.capabilities to blink.cmp merges with the capabilities in your
      -- `opts[server].capabilities, if you've defined it
      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end
    local wk = require("which-key")

    wk.register({
      -- g 系列不用走 leader，直接在普通模式下生效
      g           = {
        D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "LSP: Go to declaration" },
        d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "LSP: Go to definition" },
        i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "LSP: Go to implementation" },
        r = { "<cmd>lua vim.lsp.buf.references()<CR>", "LSP: References" },
      },

      -- 单键触发
      K           = { "<cmd>lua vim.lsp.buf.hover()<CR>", "LSP: Hover" },
      ["<C-k>"]   = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "LSP: Signature Help" },

      -- 以下走 <space> 前缀
      ["<space>"] = {
        name = "LSP", -- group name
        wa   = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add workspace folder" },
        wr   = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove workspace folder" },
        wl   = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "List workspace folders" },
        D    = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type definition" },
        rn   = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
        ca   = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code action" },
      },
    }, {
      mode = "n",  -- 普通模式生效
      prefix = "", -- 全局映射，g/K/<C-k> 不需要特别前缀
    })
  end
}
