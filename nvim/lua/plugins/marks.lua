return {
    "chentoast/marks.nvim",
    opts = {
        builtin_marks = { ".", "<", ">", "^" },
        refresh_interval = 250,
        sign_priority = { lower = 1, upper = 15, builtin = 8, bookmark = 20 },
    }
}
