return {
	"nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
	{
		"freddiehaddad/feline.nvim",
		config = true,
	},
	{
		"folke/todo-comments.nvim",
		config = true,
	},
	{
		"numToStr/Comment.nvim",
		config = true,
	},
	"JoosepAlviste/nvim-ts-context-commentstring",
	"akinsho/toggleterm.nvim",
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
	"lewis6991/impatient.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"goolord/alpha-nvim",
	"ThePrimeagen/harpoon",
	"folke/which-key.nvim",
	"ThePrimeagen/vim-be-good",

	"simrat39/rust-tools.nvim",
	{
		"saecki/crates.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
		config = function()
			local null_ls = require("null-ls")
			require("crates").setup({
				null_ls = {
					enabled = true,
					name = "crates.nvim",
				},
			})
		end,
	},

	"mbbill/undotree",
	"jdhao/whitespace.nvim",
	"tiagovla/scope.nvim",
	"RubixDev/mason-update-all",
	"hashivim/vim-terraform",
	"towolf/vim-helm",
	"jeanlucthumm/nvim-lua-format",
	"asiryk/auto-hlsearch.nvim",
	"tpope/vim-surround",
	"tpope/vim-fugitive",

	{
		"wintermute-cell/gitignore.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
	},

	"tpope/vim-rhubarb",
	"mechatroner/rainbow_csv",

	{
		"j-hui/fidget.nvim", -- standalone UI for LSP
		event = "LspAttach",
		config = true,
		tag = "legacy",
	},
	{
		"utilyre/barbecue.nvim",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		config = true,
	},
	{
		"klen/nvim-test",
		config = true,
	},

	-- Telescope
	"nvim-telescope/telescope.nvim",

	-- Treesitter
	"nvim-treesitter/nvim-treesitter",
	"nvim-treesitter/nvim-treesitter-context",

	"Glench/Vim-Jinja2-Syntax",

	-- Git
	"lewis6991/gitsigns.nvim",

	{
		"sindrets/diffview.nvim",
		dependencies = "nvim-lua/plenary.nvim",
	},

	-- DAP
	"mfussenegger/nvim-dap",
	"mfussenegger/nvim-dap-python",
	"rcarriga/nvim-dap-ui",
	"ravenxrz/DAPInstall.nvim",

	-- Screenshot code
	"segeljakt/vim-silicon",

	-- fsharp
	"ionide/Ionide-vim",

	{
		"varnishcache-friends/vim-varnish",
		ft = "vcl",
	},

	-- Database stuff
	"tpope/vim-dadbod",
	"kristijanhusak/vim-dadbod-ui",
	"kristijanhusak/vim-dadbod-completion",
}
