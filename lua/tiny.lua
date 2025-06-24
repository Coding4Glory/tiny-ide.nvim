-- require('tiny.buffers')
-- require('tiny.terminal')
-- require('tiny.templates')
-- require('tiny.projectsettings')

---@class Tiny
---@field defaults TinyConfig
---@field setup function
local M = {}


---@class TinyConfig
M.defaults = {
    buffers = true,
    terminal = true,
    templates = true,
    modeline = true,
    keymaps = true,
    projectsettings = false,
}

---@private
M.bindings = function ()
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
end

---@param opts TinyConfig?
M.setup = function(opts)
    local config = vim.tbl_deep_extend('force', M.defaults, opts or {})
    if config.buffers then require('tiny.buffers') end
    if config.terminal then require('tiny.terminal') end
    if config.templates then require('tiny.templates') end
    if config.modeline then require('tiny.modeline') end
    if config.keymaps then M.bindings() end
    if config.projectsettings then require('tiny.projectsettings') end
end

return M

--  vim: set ts=4 sw=4 tw=0 et:
