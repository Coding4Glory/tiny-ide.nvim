vim.cmd("filetype plugin indent on")
local custom_indent = vim.api.nvim_create_augroup("custom_identation", { clear = true })

vim.api.nvim_create_autocmd(
    { "FileType" },
    { 
        pattern = "yaml",
        callback = function()
            vim.bo.smarttab = true
            vim.bo.tabstop = 2
            vim.bo.shiftwidth = 2
            vim.bo.softtabstop = 2
        end,
        group = custom_indent,
        desc = "2 - 2 - 2 for yaml",
    }
)
vim.api.nvim_create_autocmd(
    { "FileType" },
    { 
        pattern = "lua",
        callback = function()
            vim.bo.expandtab = true
            vim.bo.tabstop = 4
            vim.bo.shiftwidth = 4
            vim.bo.softtabstop = 4
        end,
        group = custom_indent,
        desc = "4 - 4 - 4 for lua",
    }
)
