vim.cmd("filetype plugin indent on")

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
---if an editor buffer id is available
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

vim.api.nvim_create_user_command('Bc', buffer_close, { desc = "close buffer but try to keep window" })
vim.keymap.set("n", "<C-w><del>", buffer_close, { desc = "close buffer" })
-- vim.api.nvim_create_autocmd('WinClosed', {
--    group = vim.api.nvim_create_augroup('tiny_keep_window', { clear = true }),
--    callback = keep_open_buffer,
--    desc = "opens new window if last window is closed but editor buffers awailable"
-- })

-- other bindings
vim.keymap.set("t", "<C-w><Esc>", "<C-\\><C-n>", { desc = "back to normal mode" })
vim.keymap.set("n", "<leader>tn", function() vim.o.number = not vim.o.number end, { desc = "toggle line [n]umbers" })

-- project setting support
if (vim.uv or vim.loop).fs_stat('.nvim/init.lua') then
    -- require does not work here
    vim.cmd('source .nvim/init.lua')
end

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

-- navigate windows faster (inspired by help)
vim.keymap.set({'n', 'i', 'v'}, '<A-h>', '<C-\\><C-n><C-w>h', { desc = 'move to left window' })
vim.keymap.set({'n', 'i', 'v'}, '<A-l>', '<C-\\><C-n><C-w>l', { desc = 'move to right window' })
vim.keymap.set({'n', 'i', 'v'}, '<A-j>', '<C-\\><C-n><C-w>j', { desc = 'move to lower window' })
vim.keymap.set({'n', 'i', 'v'}, '<A-k>', '<C-\\><C-n><C-w>k', { desc = 'move to upper window' })

vim.keymap.set({'n', 'i', 'v', 't'}, '<A-Left>', '<C-\\><C-n><C-w>h', { desc = 'move to left window' })
vim.keymap.set({'n', 'i', 'v', 't'}, '<A-Right>', '<C-\\><C-n><C-w>l', { desc = 'move to right window' })
vim.keymap.set({'n', 'i', 'v', 't'}, '<A-Down>', '<C-\\><C-n><C-w>j', { desc = 'move to lower window' })
vim.keymap.set({'n', 'i', 'v', 't'}, '<A-Up>', '<C-\\><C-n><C-w>k', { desc = 'move to upper window' })

--  vim: set ts=4 sw=4 tw=0 et:
