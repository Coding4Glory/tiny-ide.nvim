---@type function
---appends the modeline to the current buffer
local function append_modeline()
    local modeline = vim.fn.printf(" vim: set ts=%d sw=%d tw=%d %set:", vim.bo.tabstop, vim.bo.shiftwidth,
        vim.bo.textwidth, (vim.bo.expandtab and '' or 'no'))
    modeline = vim.fn.substitute(vim.bo.commentstring, "%s", modeline, "")
    vim.fn.append(vim.fn.line("$"), modeline)
end
vim.keymap.set('n', '<leader>am', append_modeline, { desc = "[a]ppend [m]odeline" })
vim.api.nvim_create_user_command('ModeLine', append_modeline, { desc = "append modeline to current buffer" })

--  vim: set ts=4 sw=4 tw=0 et:
