return {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
        view_options = {
            -- Show files and directories that start with "."
            show_hidden = true,
        },
        float = {
            -- Padding around the floating window
            padding = 10,
            -- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
            max_width = 0.5,
            max_height = 0.5,
            border = "rounded",
            preview_split = "auto",
        },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
}
