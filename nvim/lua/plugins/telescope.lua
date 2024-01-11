return {
    "nvim-telescope/telescope.nvim",

    config = {
        defaults = {

            prompt_prefix = " ",
            selection_caret = " ",
            path_display = { "smart" },
            file_ignore_patterns = { ".git/", "node_modules" },

            mappings = {
                i = {
                    ["<Down>"] = require("telescope.actions").cycle_history_next,
                    ["<Up>"] = require("telescope.actions").cycle_history_prev,
                    ["<C-j>"] = require("telescope.actions").move_selection_next,
                    ["<C-k>"] = require("telescope.actions").move_selection_previous,
                },
            },
        },
    }
}
