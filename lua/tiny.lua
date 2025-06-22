vim.cmd("filetype plugin indent on")

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

require('tiny.buffers')
require('tiny.terminal')
require('tiny.templates')
require('tiny.modeline')
-- should always be last
require('tiny.projectsettings')

--  vim: set ts=4 sw=4 tw=0 et:
