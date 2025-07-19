-- first things first
-- this loads and activates the settings in lua/options.lua
require("options")

-- the initial setup relies on filetype
vim.cmd("filetype plugin indent on")

-- load plugins
require("plugins.lazy") -- bootstrap and configure lazy
require("tiny").setup({}) -- builtin plugins

