-- disable netrw
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- fix split
vim.opt.splitright = true
vim.opt.splitbelow = true

-- load plugins
require("config.filetypes")
require("config.lazy")
require("config.screenlike")

