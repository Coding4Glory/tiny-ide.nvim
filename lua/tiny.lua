---@class Tiny
---@field defaults TinyConfig
---@field setup function
local M = {}


---@class TinyConfig
M.defaults = {
    ---adds additional terminal commands, default: true
    ---@type boolean
    terminal = true,
    ---adds keymaps for movement, default: true
    ---@type boolean
    keymaps = true,
    ---adds line numbers on buffers and relative line numbers
    ---on active window
    ---@type boolean
    numbers = true,
}

M.terminal = function()
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
end

---@private
M.bindings = function()
    -- usefull toggles
    vim.keymap.set("n", "<leader>tn", function() vim.o.number = not vim.o.number end, { desc = "toggle line [n]umbers" })
    vim.keymap.set("n", "<leader>tl", function() vim.o.list = not vim.o.list end, { desc = "toggle [l]ist" })

    -- navigate windows faster (inspired by help)
    vim.keymap.set({ 'n', 'i', 'v' }, '<A-h>', '<C-\\><C-n><C-w>h', { desc = 'move to left window' })
    vim.keymap.set({ 'n', 'i', 'v' }, '<A-l>', '<C-\\><C-n><C-w>l', { desc = 'move to right window' })
    vim.keymap.set({ 'n', 'i', 'v' }, '<A-j>', '<C-\\><C-n><C-w>j', { desc = 'move to lower window' })
    vim.keymap.set({ 'n', 'i', 'v' }, '<A-k>', '<C-\\><C-n><C-w>k', { desc = 'move to upper window' })

    vim.keymap.set({ 'n', 'i', 'v', 't' }, '<A-Left>', '<C-\\><C-n><C-w>h', { desc = 'move to left window' })
    vim.keymap.set({ 'n', 'i', 'v', 't' }, '<A-Right>', '<C-\\><C-n><C-w>l', { desc = 'move to right window' })
    vim.keymap.set({ 'n', 'i', 'v', 't' }, '<A-Down>', '<C-\\><C-n><C-w>j', { desc = 'move to lower window' })
    vim.keymap.set({ 'n', 'i', 'v', 't' }, '<A-Up>', '<C-\\><C-n><C-w>k', { desc = 'move to upper window' })

    -- switch tabs easily
    vim.keymap.set('n', '<leader><Tab>', '<cmd>tabn<CR>', { desc = 'next tab' })
    vim.keymap.set('n', '<leader><S-Tab>', '<cmd>tabp<CR>', { desc = 'previous tab' })
end

M.numbers = function()
    local number_group = vim.api.nvim_create_augroup('tiny_line_numbers', { clear = true })
    vim.api.nvim_create_autocmd(
        { 'BufRead', 'BufNewFile' },
        {
            callback = function(a)
                if vim.api.nvim_get_option_value('modifiable', { buf = a.buf }) == true then
                    vim.api.nvim_set_option_value('number', true, { scope = 'local' })
                    vim.api.nvim_set_option_value('relativenumber', true, { scope = 'local' })
                end
            end,
            group = number_group,
            desc = 'add numbers and relative to new buffer',
        }
    )
    vim.api.nvim.nvim_create_autocmd('WinEnter',
        {
            group = number_group,
            desc = 'add relative numbers on enter',
            callback = function(a)
                if vim.api.nvim_get_option_value("number", { scope = 'local' }) == true then
                    vim.api.nvim_set_option_value("relativenumber", true, { scope = 'local' })
                end
            end
        })
    vim.api.nvim.nvim_create_autocmd('WinLeave',
        {
            group = number_group,
            desc = 'add relative numbers on enter',
            callback = function(a)
                if vim.api.nvim_get_option_value("relativenumber", { scope = 'local' }) == true then
                    vim.api.nvim_set_option_value("relativenumber", false, { scope = 'local' })
                end
            end
        })
end

---@param opts TinyConfig?
M.setup = function(opts)
    local config = vim.tbl_deep_extend('force', M.defaults, opts or {})
    if config.terminal then M.terminal() end
    if config.keymaps then M.bindings() end
    if config.numbers then M.numbers() end
end

return M

--  vim: set ts=4 sw=4 tw=0 et:
