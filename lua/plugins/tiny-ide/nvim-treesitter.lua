return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = {
                "lua",
                "vim",
                "vimdoc",
                "markdown",
                "markdown_inline",
            },
            ignore_install = {},
            auto_install = false,
            sync_install = false,
            highlight = {
                additional_vim_regex_highlighting = false,
                enable = true,
            },
        })
    end,
}
