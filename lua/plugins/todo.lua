-- see: https://neovimcraft.com/plugin/folke/todo-comments.nvim/
return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>tt", ":TodoLocList<CR>", { desc = "[t]odo's" } },
    },
    opts = {},
}
