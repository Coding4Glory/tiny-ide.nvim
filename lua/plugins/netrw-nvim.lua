return {
    "prichrd/netrw.nvim", 
    opts = {
        use_devicons = true,
        mappings = {
            ['<leader>ei'] = function(payload) print(vim.inspect(payload)) end,
        },
        user_mappings = {
            { "<c-p>", 'lua print("hello world")' }
        }
    }
}
