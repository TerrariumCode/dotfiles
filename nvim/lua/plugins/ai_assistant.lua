return {
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            adapters = {
                copilot = function ()
                    return require("codecompanion.adapters").extend("copilot", {
                        -- schema = {
                        --     model = {
                        --         default = "claude-3.7-sonnet",
                        --     },
                        -- },
                    })
                end,
            },
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
