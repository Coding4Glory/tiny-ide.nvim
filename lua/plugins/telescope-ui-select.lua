return {
	"nvim-telescope/telescope-ui-select.nvim",
	dependencies = {
		{
			"nvim-telescope/telescope.nvim",
			tag = "0.1.8",
			dependencies = { "nvim-lua/plenary.nvim" },
			config = function()
				local tlcBuiltin = require("telescope.builtin")
				-- normal mode
				vim.keymap.set("n", "<leader>fb", tlcBuiltin.buffers, { desc = "Telescope [f]ind [b]uffer" })
				vim.keymap.set("n", "<leader>fc", function()
					tlcBuiltin.live_grep({ search_dirs = { vim.fn["stdpath"]("config") } })
				end, { desc = "Telescope [f]ind in [c]config" })
				vim.keymap.set("n", "<leader>ff", tlcBuiltin.find_files, { desc = "Telescope [f]ind [f]iles" })
				vim.keymap.set("n", "<leader>fg", tlcBuiltin.live_grep, { desc = "Telescope [f]ind [g]rep in workdir" })
				vim.keymap.set("n", "<leader>fh", tlcBuiltin.help_tags, { desc = "Telescope [f]ind [h]elp" })
				vim.keymap.set("n", "<leader>fo", function()
					tlcBuiltin.live_grep({ grep_open_files = true })
				end, { desc = "Telescope [find] in [o]pen buffers" })
				vim.keymap.set("n", "<C-f>.", tlcBuiltin.grep_string, { desc = "find in workdir" })
				-- insert mode
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
