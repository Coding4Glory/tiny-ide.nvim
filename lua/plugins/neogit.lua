return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
    },
    config = function()
        local git = require('neogit')
        vim.keymap.set('n', '<leader>tg', function() git.open({ kind = "split" }) end, { desc = '[t]oggle Neo[g]it' })
        vim.keymap.set('n', '<leader>gc', function() git.open({ "commit", kind = "floating" }) end, { desc = '[g]it [c]ommit' })
        vim.keymap.set('n', '<leader>gd', function() git.open({ "diff" }) end, { desc = '[g]it [d]iff' }) 
        vim.keymap.set('n', '<leader>gp', function() git.open({ "pull", kind = "floating" }) end, { desc = '[g]it [p]ull' }) 
        vim.keymap.set('n', '<leader>gP', function() git.open({ "push" }) end, { desc = '[g]it [P]ush' }) 
        vim.keymap.set('n', '<leader>gf', function() git.open({ "fetch", kind = "floating" }) end, { desc = '[g]it [f]etch' }) 
    end,
}
