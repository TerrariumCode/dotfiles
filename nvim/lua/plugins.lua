return {
    "nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
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
    "lewis6991/impatient.nvim",
    "lukas-reineke/indent-blankline.nvim",
    "goolord/alpha-nvim",
    "ThePrimeagen/harpoon",
    "folke/which-key.nvim",
    "ThePrimeagen/vim-be-good",
    {
        "saecki/crates.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local null_ls = require("null-ls")
            require("crates").setup {
                null_ls = {
                    enabled = true,
                    name = "crates.nvim",
                },
            }
        end,
    },
    {
      "VonHeikemen/fine-cmdline.nvim",
      dependencies = {
        "MunifTanjim/nui.nvim",
      },
    },
    "mbbill/undotree",
    "jdhao/whitespace.nvim",
    "tiagovla/scope.nvim",
    "RubixDev/mason-update-all",
    "hashivim/vim-terraform",
    "jeanlucthumm/nvim-lua-format",
    "asiryk/auto-hlsearch.nvim",
    "tpope/vim-surround",

    "mechatroner/rainbow_csv",

    {
        "j-hui/fidget.nvim",  -- standalone UI for LSP
        config = true,
        tag = "legacy",
    },
    "simrat39/rust-tools.nvim",
    "jose-elias-alvarez/null-ls.nvim",
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
        config = true
    },

    -- Telescope
    "nvim-telescope/telescope.nvim",

    -- Treesitter
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-context",

    -- Git
    "lewis6991/gitsigns.nvim",

    {
        "sindrets/diffview.nvim",
        dependencies = "nvim-lua/plenary.nvim"
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

}
