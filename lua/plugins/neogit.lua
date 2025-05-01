return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
    },
    config = function()
        local git = require('neogit')
        vim.keymap.set('n', '<leader>tg', function() git.open({ kind = "split" }) end, { desc = 'toggle Neo[g]it' })
        vim.keymap.set('n', '<leader>gc', function() git.open({ "commit", kind = "floating" }) end, { desc = 'git [c]ommit' })
        vim.keymap.set('n', '<leader>gs', function() git.open({ "stage" }) end, { desc = 'git stage' }) 
        vim.keymap.set('n', '<leader>gp', function() git.open({ "pull", kind = "floating" }) end, { desc = 'git [p]ull' }) 
        vim.keymap.set('n', '<leader>gP', function() git.open({ "push" }) end, { desc = 'git [P]ush' }) 
        vim.keymap.set('n', '<leader>gf', function() git.open({ "fetch", kind = "floating" }) end, { desc = 'git [f]etch' }) 
    end,
}
