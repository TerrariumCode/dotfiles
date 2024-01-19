return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			{
				ensure_installed = "all", -- one of "all" or a list of languages
				ignore_install = { "" }, -- List of parsers to ignore installing
				sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)

				highlight = {
					enable = true, -- false will disable the whole extension
					disable = { "css" }, -- list of language that will be disabled
				},
				autopairs = {
					enable = true,
				},
				indent = { enable = true, disable = { "css" } },
			},
		},
	},
	"nvim-treesitter/nvim-treesitter-context",
	"JoosepAlviste/nvim-ts-context-commentstring",
}
