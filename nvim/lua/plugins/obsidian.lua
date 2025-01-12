return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    event = { "BufReadPre " .. vim.fn.expand "~" .. "/Documents/play_pop_obsidian/**.md" },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "personal",
                path = "~/Documents/play_pop_obsidian",
            },
        },
    },
}
