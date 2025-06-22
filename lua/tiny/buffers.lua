-- better buffer control
local function get_editor_count()
    local all_bufs = vim.api.nvim_list_bufs()
    local loaded_count = 0
    for _, b in ipairs(all_bufs) do
        if vim.fn.buflisted(b) == 1 then
            loaded_count = loaded_count + 1
        end
    end
    return loaded_count
end

---@type function
---@param opts table
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

---@type function
---experimetal function to keep at least one editor window open
---if an editor buffer is available
---@param opts table options passed via aucmd
local function keep_open_buffer(opts)
    local all_windows = vim.api.nvim_list_wins()
    local editor_windows = 0
    for _, w in ipairs(all_windows) do
        local buf = vim.api.nvim_win_get_buf(w)
        editor_windows = editor_windows + vim.fn.buflisted(buf)
    end
    local editor_buffers = get_editor_count()
    if editor_windows == 0 and editor_buffers > 0 then
        print('restore window')
        vim.cmd('new')
        buffer_close({})
    end
end

vim.api.nvim_create_user_command('Bc', buffer_close, { desc = "close buffer but try to keep window", bang = true })
vim.keymap.set("n", "<C-w><del>", buffer_close, { desc = "close buffer" })
-- vim.api.nvim_create_autocmd('WinClosed', {
--    group = vim.api.nvim_create_augroup('tiny_keep_window', { clear = true }),
--    callback = keep_open_buffer,
--    desc = "opens new window if last window is closed but editor buffers awailable"
-- })


