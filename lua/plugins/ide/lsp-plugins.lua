return {
    {
        "williamboman/mason.nvim",
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "lua_ls",
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            vim.keymap.set("n", "<leader>d<space>", vim.diagnostic.open_float, { desc = "show" })
            vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "goto next" })
            vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "goto previous" })

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    -- leader key maps, may be removed in favour of default bindings
                    vim.keymap.set("n", "<leader>ci", vim.lsp.buf.hover, { desc = "LSP [c]ode [i]nspect" })
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP code inspect" })
                    vim.keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, { desc = "LSP [D]eclaration" })
                    vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "LSP [d]efinition" })
                    vim.keymap.set("n", "<leader>ct", vim.lsp.buf.type_definition, { desc = "LSP [t]type definition" })
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP code [a]ction" })
                    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references, { desc = "LSP code [r]eferences" })
                    vim.keymap.set("n", "<leader>cR", vim.lsp.buf.rename, { desc = "LSP [R]ename symbol" })

                    local tlcBuiltin = require("telescope.builtin")
                    vim.keymap.set("n", "<leader>fd", tlcBuiltin.lsp_definitions, { desc = "find [d]efinitions" })
                    vim.keymap.set("n", "<leader>fr", tlcBuiltin.lsp_references, { desc = "find [r]eferences" })
                end,
            })
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.stylua,
                },
            })

            vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "[f]ormat buffer" })
        end,
    },
}
