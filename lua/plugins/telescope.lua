return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        defaults = {
            mappings = {
                i = {
                    ["<C-h>"] = "which_key"
                }
            }
	},
    },
    config = function() 
        local tlcBuiltin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>sf', tlcBuiltin.find_files, { desc = 'Telescope [s]earch [f]iles' })
        vim.keymap.set('n', '<leader>sg', tlcBuiltin.live_grep, { desc = 'Telescope [s]earch [g]rep' })
        vim.keymap.set('n', '<leader>sb', tlcBuiltin.buffers, { desc = 'Telescope [s]earch [s]each [b]uffers' })
        vim.keymap.set('n', '<leader>sh', tlcBuiltin.help_tags, { desc = 'Telescope [s]earch [h]elp' })


    end
}
