---@class Tiny
---@field defaults TinyConfig
---@field setup function
local M = {}


---@class TinyConfig
M.defaults = {
    terminal = true,
    keymaps = true,
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

---@param opts TinyConfig?
M.setup = function(opts)
    local config = vim.tbl_deep_extend('force', M.defaults, opts or {})
    if config.terminal then M.terminal() end
    if config.keymaps then M.bindings() end
end

return M

--  vim: set ts=4 sw=4 tw=0 et:
