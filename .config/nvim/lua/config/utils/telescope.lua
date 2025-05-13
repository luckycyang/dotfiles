local is_ok, builtin = pcall(require, "telescope.builtin")
if not is_ok then
  return
end

-- vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = 'find_files' })
-- vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = 'git_files' })
-- vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = 'oldfiles' }) -- i.e. previously open files
-- vim.keymap.set("n", "<leader>fc", function()                               -- fc = find by command
--   builtin.grep_string({ search = vim.fn.input("Grep > ") })
-- end, { desc = 'grep_string' })
--
local wk = require("which-key")

-- 注册快捷键
wk.register({
  f = {
    name = "File",                                                                                   -- 这是 <leader>f 的提示标题
    f = { builtin.find_files, "Find Files" },                                                        -- <leader>ff 的功能和描述
    g = { builtin.git_files, "Git Files" },                                                          -- <leader>fg 的功能和描述
    o = { builtin.oldfiles, "Old Files" },                                                           -- <leader>fo 的功能和描述
    c = { function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end, "Grep String" }, -- <leader>fc 的功能和描述
    l = { builtin.live_grep, "Live Grep" },                                                          -- <leader>fl 的功能和描述
  },
}, { prefix = "<leader>" })
