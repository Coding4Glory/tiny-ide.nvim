return {
    "prichrd/netrw.nvim",
    config = function()
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
        vim.keymap.set('n', '<leader>te', ":15Lex<CR>", { desc = "[t]oggle [e]xplorer" })
    end,
}
