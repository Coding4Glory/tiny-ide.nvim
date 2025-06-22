vim.api.nvim_create_user_command('Term', 'tabnew | term', {})
vim.api.nvim_create_user_command('Vterm', 'vs | term', {})

local function split_terminal(d)
    local split_before = vim.opt.splitbelow
    vim.opt.splitbelow = d
    vim.cmd('sp | term');
    vim.opt.splitbelow = split_before
end

vim.api.nvim_create_user_command('Sterm', function()
    split_terminal(false)
end, {})
vim.api.nvim_create_user_command('Bterm', function()
    split_terminal(true)
end, {})

vim.keymap.set("t", "<C-w><Esc>", "<C-\\><C-n>", { desc = "back to normal mode" })
