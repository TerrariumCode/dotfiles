return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPre", "BufNewFile" },
        main = "nvim-treesitter.configs",
        opts = {
            ensure_installed = "all", -- one of "all" or a list of languages
            ignore_install = { "ipkg" }, -- List of parsers to ignore installing
            sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
            highlight = {
                enable = true,   -- false will disable the whole extension
                disable = { "css", "rust" }, -- list of language that will be disabled
            },
            autopairs = {
                enable = true,
            },
            indent = { enable = true, disable = { "css" } },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                    },
                },
            },
        },
    },
    "nvim-treesitter/nvim-treesitter-context",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "JoosepAlviste/nvim-ts-context-commentstring",
}
