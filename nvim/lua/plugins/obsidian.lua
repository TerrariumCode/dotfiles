return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    event = { "BufReadPre " .. vim.fn.expand "~" .. "/Documents/WorkVault/**.md" },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        picker = {
            name = "fzf-lua",
        },
        workspaces = {
            {
                name = "personal",
                path = "~/Documents/play_pop_obsidian",
            },
        },
    },
}
