return {
    {
        "lewis6991/gitsigns.nvim",
        opts = {},
    },
    {
        "FabijanZulj/blame.nvim",
        lazy = false,
        opts = {},
    },
    {
        "rhysd/git-messenger.vim",
        config = function()
            vim.g.git_messenger_always_into_popup = true
            vim.g.git_messenger_floating_win_opts = { border = 'single' }
        end,
    },
    {
        'topaxi/pipeline.nvim',
        build = 'make',
        ---@type pipeline.Config
        opts = {
            split = {
                relative = 'editor',
                position = 'right',
                size = 120,
                win_options = {
                    wrap = true,
                    number = false,
                    foldlevel = nil,
                    foldcolumn = '0',
                    cursorcolumn = false,
                    signcolumn = 'no',
                },
            },
        },
    },
    {
        "aaronhallaert/advanced-git-search.nvim",
        cmd = { "AdvancedGitSearch" },
        config = function()
            -- optional: setup telescope before loading the extension
            require("telescope").setup {
                -- move this to the place where you call the telescope setup function
                extensions = {
                    advanced_git_search = { -- Browse command to open commits in browser. Default fugitive GBrowse.
                        browse_command = "GBrowse {commit_hash}",
                        diff_plugin = "fugitive",
                        show_builtin_git_pickers = false,
                        entry_default_author_or_date = "both", -- one of "author", "date" or "both"
                        keymaps = {
                            toggle_date_author = "<C-w>",
                            open_commit_in_browser = "<C-o>",
                            copy_commit_hash = "<C-y>",
                            show_entire_commit = "<C-e>",
                        },
                    },
                }
            }
            require("telescope").load_extension("advanced_git_search")
        end,
        dependencies = {
            -- to show diff splits and open commits in browser
            "tpope/vim-fugitive",
            -- to open commits in browser with fugitive
            "tpope/vim-rhubarb",
        },
    }
}
