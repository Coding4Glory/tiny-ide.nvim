return {
    {
        "williamboman/mason.nvim",
        opts = {},
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
                capabilities = capabilities,
--                server_capabilities = {
--                    semantic_provider = vim.NIL
--                },
--                diagnostics = {
--                    globals = {
--                        'vim', 'require'
--                   }
--                }
            })

            -- some bindings are now created per default, keep this as reminder
            -- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
            -- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
            -- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
            -- vim.keymap.set('n', '<space>q', vim.diagnostic.setlocallist)

            -- leader key maps, may be removed in favour of default bindings
            vim.keymap.set('n', '<leader>ci', vim.lsp.buf.hover, { desc = "LSP [c]ode [i]nspect" })
            vim.keymap.set('n', '<leader>cD', vim.lsp.buf.declaration, { desc = "LSP [c]ode [D]eclaration" })
            vim.keymap.set('n', '<leader>cd', vim.lsp.buf.definition, { desc = "LSP [c]ode [d]efinition" })
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "LSP [c]ode [a]ction"})
        end,
    }
}
