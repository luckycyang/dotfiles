-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- colortheme
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    -- Noice like mark
    require('config.mise.noice'),
    -- luasnip
    require('config.mise.luasnip'),
    -- cmp
    -- require('config.completion.cmp'),
    -- blink cmp
    require('config.completion.blink'),
    -- lsp
    require('config.lsp.lsp'),
    -- conform for code format
    require('config.lsp.conform'),
    -- neo-tree
    require('config.utils.neo-tree'),
    -- bufferline
    require('config.utils.bufferline'),
    -- nvim-treesitter
    require('config.mise.nvim-treesitter'),
    -- telescope
    require('config.utils.telescope'),
    -- witch-key
    require('config.utils.witch-key'),
  }
})
