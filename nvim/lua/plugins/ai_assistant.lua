return {
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            strategies = {
                stream = {
                    adapter = "ollama",
                },
                chat = {
                    adapter = "copilot",
                },
                inline = {
                    adapter = "copilot",
                },
            },
        }
    },
    {
        "github/copilot.vim",
        config = function()
            vim.g.copilot_enabled = 0
        end,
    }
}
