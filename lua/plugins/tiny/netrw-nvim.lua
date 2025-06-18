return {
    "prichrd/netrw.nvim",
    config = function()
        local open_tree = function() vim.cmd("15Lex") end
        require("netrw").setup({
            icons = {
                symlink = '<',
                file = '-',
                directory = '+'
            },
            -- use_devicons = true,
            mappings = {
                ['K'] = function(payload) print(vim.inspect(payload)) end,
            },
        })
        vim.g.netrw_banner = 0
        -- vim.g.netrw_browse_split = -3
        vim.g.netrw_liststyle = 3
--        vim.keymap.set('n', '<leader>te', open_tree, { desc = "[t]oggle [e]xplorer" })
    end,
}