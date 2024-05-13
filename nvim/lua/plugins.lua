return {
    "nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
    {
        "laytan/cloak.nvim",
        config = true,
    },
    {
        "folke/todo-comments.nvim",
        config = true,
    },
    {
        "numToStr/Comment.nvim",
        -- enable_autocmd = false,
        -- config = {
        -- pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        -- },
        lazy = false,
    },
    "JoosepAlviste/nvim-ts-context-commentstring",
    "lewis6991/impatient.nvim",
    "lukas-reineke/indent-blankline.nvim",
    "ThePrimeagen/harpoon",
    "folke/zen-mode.nvim",
    "ThePrimeagen/vim-be-good",

    "eandrju/cellular-automaton.nvim",

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
    "tpope/vim-obsession",
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

    "Glench/Vim-Jinja2-Syntax",

    {
        "sindrets/diffview.nvim",
        dependencies = "nvim-lua/plenary.nvim",
    },

    -- Screenshot code
    "segeljakt/vim-silicon",

    -- fsharp
    "ionide/Ionide-vim",

    {
        "varnishcache-friends/vim-varnish",
        ft = "vcl",
    },
}
