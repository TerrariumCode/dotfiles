return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    event = { "BufReadPre " .. vim.fn.expand "~" .. "/Documents/WorkVault/**.md" },
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
