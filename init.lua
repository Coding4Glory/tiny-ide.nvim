-- first things first
-- this loads and activates the settings in lua/options.lua
require("options")

-- the initial setup relies on filetype
vim.cmd("filetype plugin indent on")

-- load builtin micro plugins
require("builtin").setup({}) -- builtin plugins

-- load plugins
require("plugins.lazy") -- bootstrap and configure lazy

