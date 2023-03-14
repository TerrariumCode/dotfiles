return {
    {
        "romgrk/barbar.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        event = "BufEnter",
        opts = {
            auto_hide = false,
            hide = {extensions = false, inactive = false},
        }
    },
}
