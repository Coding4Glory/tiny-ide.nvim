vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.lazy")

vim.cmd("filetype plugin indent on")
local custom_indent = vim.api.nvim_create_augroup("custom_identation", { clear = true })
vim.api.nvim_create_autocmd(
    { "FileType" },
    { 
        pattern = "yaml",
	callback = function()
	    vim.opt.local_smarttab = true
	    vim.opt.local_tabstop = 4
	    vim.opt.local_shiftwidth = 4
	    vim.opt.local_softtabstop = 4
	end,
	group = custom_indent,
	desc = "Custom indentation for specific file types",
    }
)
