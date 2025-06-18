return {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { "<leader>te", "<CMD>NvimTreeToggle<CR>", desc = "toggle file [e]xplorer" },
    },
    opts = {
        filters = {
            custom = { "^\\.git$" }
        },
        renderer = {
            icons = {
                glyphs = {
                    default = ".",
                    symlink = "🔗",
                    bookmark = "🔖",
                    modified = "*",
                    hidden = "🤦🏽‍♀️",
                    folder = {
                        arrow_closed = "+",
                        arrow_open = "-",
                        default = "🗂",
                        open = "📂",
                        empty = "📁",
                        empty_open = "📂",
                        symlink = "🔗",
                        symlink_open = "🖇"
                    },
                    git = {
                        unstaged = "✗",
                        staged = "✓",
                        unmerged = "⚠",
                        renamed = "➜",
                        untracked = "★",
                        deleted = "🗑",
                        ignored = "🚫",
                     }
                }
            }
        },
    }
    -- config = function()
    --     require("nvim-tree").setup {
    --         filters = {
    --             custom = { "^\\.git$" }
    --         }
    --     }
    --     local api = require("nvim-tree.api")
    --     vim.keymap.set('n', '<leader>te', api.tree.toggle, { desc = '[t]oggle file [e]xplorer'})
    --     vim.api.nvim_create_autocmd("VimEnter", {
    --         group = vim.api.nvim_create_augroup("always_open_tree", {}),
    --         callback = function()
    --             if not api.tree.is_visible() then
    --                 api.tree.open()
    --             end
    --         end
    --     })
}
