return {
    "aaronhallaert/advanced-git-search.nvim",
    cmd = { "AdvancedGitSearch" },
    config = function()
        require("advanced_git_search.fzf").setup {
            -- Browse command to open commits in browser. Default fugitive GBrowse.
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
        }
    end,
    dependencies = {
        -- to show diff splits and open commits in browser
        "tpope/vim-fugitive",
        -- to open commits in browser with fugitive
        "tpope/vim-rhubarb",
    },
}
