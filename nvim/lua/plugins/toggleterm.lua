return {
	{
		"akinsho/toggleterm.nvim",
		opts = {
			size = 20,
			open_mapping = [[<c-\>]],
			hide_numbers = true,
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			persist_mode = true,
			direction = "float",
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved",
			},
		},
	},
	{
		"https://git.sr.ht/~havi/telescope-toggleterm.nvim",
		event = "TermOpen",
		requires = {
			"akinsho/nvim-toggleterm.lua",
			"nvim-telescope/telescope.nvim",
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").load_extension("toggleterm")
		end,
	},
}
