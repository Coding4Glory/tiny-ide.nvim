local function get_editor_count()
    local all_bufs = vim.api.nvim_list_bufs()
    local loaded_count = 0
    for _, b in ipairs(all_bufs) do
        if vim.fn.buflisted(b) == 1 then
            print("buffer " ..b.. " loaded")
            loaded_count = loaded_count + 1
        end
    end
    print("editor count: " ..loaded_count)
    return loaded_count
end

local function buffer_close(opts)
    if vim.bo.modified and not opts.bang then
        vim.api.nvim_err_writeln('Modified buffer save changes (:w) or override with :Bc!')
        return
    end
    if get_editor_count() > 1 then
        vim.cmd('bn|bd#')
        return
    end
    vim.api.nvim_err_writeln('No buffer left for window. Use :q')
end

vim.keymap.set('n', '<C-a>t', ":$tabnew<CR>", { desc = 'create [t]ab' })
vim.keymap.set('n', '<C-a><Tab>', ":-tabnext<CR>", { desc = 'next <TAB>' })
vim.keymap.set('n', '<C-a><S-Tab>', ":+tabnext<CR>", { desc = 'previou<S-TAB>' })
vim.keymap.set('n', '<C-a>c', ":enew<CR>", { desc = '[n]ew buffer' })
vim.keymap.set('n', '<C-a>n', ":bn<CR>", { desc = 'next buffer' })
vim.keymap.set('n', '<C-a>x', buffer_close, { desc = 'close buffer' })
vim.api.nvim_create_user_command('Bc', buffer_close, {})
vim.api.nvim_create_user_command('Term', 'split | term', {})
