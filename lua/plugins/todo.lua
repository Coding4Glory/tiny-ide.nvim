-- see: https://neovimcraft.com/plugin/folke/todo-comments.nvim/
return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
      require("todo-comments").setup({})

      vim.keymap.set('n', '<leader>tt', ':TodoLocList<CR>', { desc = "[t]odo's" })
  end,
 }
