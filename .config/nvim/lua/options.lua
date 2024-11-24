-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.opt.completeopt = { "menu", "menuone", "noinsert" }
vim.opt.mouse = "a"               -- allow the mouse to be used in Nvim
vim.opt.scrolloff = 10            -- no less than 10 lines even if you keep scrolling down
vim.wo.wrap = false

-- Tab
vim.opt.tabstop = 2      -- the number of visual spaces per TAB
vim.opt.softtabstop = 2  -- number of spacesin tab when editing
vim.opt.shiftwidth = 2   -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces, mainly because of python

-- UI config
vim.opt.number = true          -- show absolute number
vim.opt.relativenumber = false -- add numbers to each line on the left side
vim.opt.cursorline = true      -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true      -- open new vertical split bottom
vim.opt.splitright = true      -- open new horizontal splits right
vim.opt.termguicolors = true   -- enable 24-bit RGB color in the TUI
vim.opt.showmode = false       -- we are experienced, and we don't need the "-- INSERT --" mode hint

-- Searching
vim.opt.incsearch = true  -- search as characters are entered
vim.opt.hlsearch = false  -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true  -- but make it case sensitive if an uppercase is entered

-- For nvim-tree
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
