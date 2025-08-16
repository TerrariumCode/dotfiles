-- Scratch plugin
return {
    {
        "epwalsh/obsidian.nvim",
        version = "*",
        lazy = false,
        ft = "markdown",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "ibhagwan/fzf-lua",
        },
        opts = {
            picker = {
                name = "fzf-lua",
            },
            workspaces = {
                {
                    name = "personal",
                    path = "~/Documents/WorkVault/",
                    overrides = {
                        notes_subdir = "dailies",
                    },
                },
            },
        },
    },
    {
        "leobeosab/brr.nvim",
        opts = {
            root = vim.fn.expand "~" .. "/Documents/WorkVault/scratches",
            style = {
                width = 0.8,
                height = 0.8,
                title_padding = 2
            }
        },
    },
}
