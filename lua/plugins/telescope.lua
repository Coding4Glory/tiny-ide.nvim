return {
	"nvim-telescope/telescope-ui-select.nvim",
	dependencies = {
		{
			"nvim-telescope/telescope.nvim",
			tag = "0.1.8",
			dependencies = { "nvim-lua/plenary.nvim" },
			config = function()
				local tlcBuiltin = require("telescope.builtin")
				-- # normal mode
                -- find
				vim.keymap.set("n", "<leader>fb", tlcBuiltin.buffers, { desc = "find in [b]uffer" })
				vim.keymap.set("n", "<leader>fc", function()
					tlcBuiltin.live_grep({ search_dirs = { vim.fn["stdpath"]("config") } })
				end, { desc = "Telescope [f]ind in [c]config" })
				vim.keymap.set("n", "<leader>ff", tlcBuiltin.find_files, { desc = "find [f]ile" })
				vim.keymap.set("n", "<leader>fg", tlcBuiltin.live_grep, { desc = "[g]rep in workdir" })
				vim.keymap.set("n", "<leader>fh", tlcBuiltin.help_tags, { desc = "find [h]elp" })
				vim.keymap.set("n", "<leader>fo", function()
					tlcBuiltin.live_grep({ grep_open_files = true })
				end, { desc = "find in [o]pen buffers" })
                vim.keymap.set("n", "<leader>fP", tlcBuiltin.builtin, { desc = "Telescope [P]icker" })
                vim.keymap.set("n", "<leader>fs", function() tlcBuiltin.treesitter(require("telescope.themes").get_dropdown({ enable_preview = true })) end, { desc = "find [s]ymbol" })
				vim.keymap.set("n", "<C-f>.", tlcBuiltin.grep_string, { desc = "find in workdir" })
                vim.keymap.set("n", "<C-f>f", function() tlcBuiltin.current_buffer_fuzzy_find({ skip_empty_lines = true }) end, { desc = "fuzzy [f]ind in buffer" })
                -- select
                vim.keymap.set("n", "<leader>sc", function() tlcBuiltin.colorscheme(require("telescope.themes").get_dropdown({ enable_preview = true })) end, { desc = "select [c]olor theme" })
				-- # insert mode
				vim.keymap.set("i", "<C-f>o", function()
					tlcBuiltin.grep_string({ grep_open_files = true })
				end, { desc = "find in open buffers" })
			end,
		},
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		})
		telescope.load_extension("ui-select")
	end,
}
