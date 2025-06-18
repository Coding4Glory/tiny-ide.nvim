-- screen like bindings
-- TODO: become a terminal control binding set instead of a window control set
if not vim.startswith(vim.env["TERM"], "screen") then
    vim.keymap.set('n', '<C-a>t', ":$tabnew<CR>", { desc = 'create [t]ab' })
    -- vim.keymap.set('n', '<C-a><Tab>', ":-tabnext<CR>", { desc = 'next <TAB>' })
    -- vim.keymap.set('n', '<C-a><S-Tab>', ":+tabnext<CR>", { desc = 'previou<S-TAB>' })
    vim.keymap.set('n', '<C-a><Tab>', "<C-W> w", { desc = 'next <TAB>' })
    vim.keymap.set('n', '<C-a><S-Tab>', "<C-W> W", { desc = 'previou<S-TAB>' })
    vim.keymap.set('n', '<C-a>c', ":enew<CR>", { desc = '[n]ew buffer' })
    vim.keymap.set('n', '<C-a>k', ":enew<CR>", { desc = '[k]ill buffer' })
    vim.keymap.set('n', '<C-a>n', ":bn<CR>", { desc = '[n]ext buffer' })
    vim.keymap.set('n', '<C-a>S', ":split<CR>", { desc = '[S]plit buffer horizontally' })
    vim.keymap.set('n', '<C-a>|', ":vsplit<CR>", { desc = 'split buffer vertically' })
    -- vim.keymap.set('n', '<C-a>X', buffer_close, { desc = 'close buffer' })
end


