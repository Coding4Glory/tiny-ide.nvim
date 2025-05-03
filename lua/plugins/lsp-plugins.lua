return {
    {
        "williamboman/mason.nvim",
        config = true,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls" }
        }
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            vim.keymap.set('n', '<leader>ci', vim.lsp.buf.hover, { desc = "LSP [c]ode [i]nspect" })
            vim.keymap.set('n', '<leader>cd', vim.lsp.buf.definition, { desc = "LSP [c]ode [d]efinition" })
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "LSP [c]ode [a]ction"})
        end,
    }
}
