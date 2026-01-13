return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    build = "make install_jsregexp"
  },
  { "neovim/nvim-lspconfig", },
  require('cyang.plugins.witch-key'),
  require('cyang.plugins.telescope'),
  require('cyang.plugins.lazygit'),
  require('cyang.plugins.noice'),
  require('cyang.plugins.cmp'),
  require('cyang.plugins.avante'),
  -- require('cyang.plugins.blink'),


}
