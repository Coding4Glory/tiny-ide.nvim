-- first things first
require("bootstrap.disable-netrw")

-- fix split
vim.opt.splitright = true
vim.opt.splitbelow = true

-- show context
vim.opt.scrolloff = 2

-- load plugins
require("config.filetypes")
require("config.lazy")
require("config.screenlike")

