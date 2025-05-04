return {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup {
            filters = {
                custom = { "^\\.git$" }
            }
        }
        local api = require("nvim-tree.api")
        vim.keymap.set('n', '<leader>te', api.tree.toggle, { desc = '[t]oggle file [e]xplorer'})
        vim.api.nvim_create_autocmd("VimEnter", {
            group = vim.api.nvim_create_augroup("always_open_tree", {}),
            callback = function()
                if not api.tree.is_visible() then
                    api.tree.open()
                end
            end
        })
    end,
}
