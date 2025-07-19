-- see: https://neovimcraft.com/plugin/folke/todo-comments.nvim/
return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>tt", ":TodoLocList<CR>", desc = "[t]odos" },
    },
    opts = {},
}

--  vim: set ts=4 sw=4 tw=0 et:
