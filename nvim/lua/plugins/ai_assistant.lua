return {
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            adapters = {
                copilot = function()
                    return require("codecompanion.adapters").extend("copilot", {
                        schema = {
                            model = {
                                default = "claude-3.7-sonnet",
                            },
                        },
                    })
                end,
            },
            strategies = {
                stream = {
                    adapter = "ollama",
                },
                chat = {
                    adapter = "copilot",
                    tools = {
                        ["mcp"] = {
                            -- Prevent mcphub from loading before needed
                            callback = function()
                                return require("mcphub.extensions.codecompanion")
                            end,
                            description = "Call tools and resources from the MCP Servers"
                        }
                    }
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
    },
    {
        "ravitemer/mcphub.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
        },
        cmd = "MCPHub",                          -- lazy load by default
        build = "bundled_build.lua",  -- Use this and set use_bundled_binary = true in opts  (see Advanced configuration)
        config = function()
            require("mcphub").setup({
                use_bundled_binary = true,
                extensions = {
                    codecompanion = {
                        -- Show the mcp tool result in the chat buffer
                        show_result_in_chat = true,
                        -- Make chat #variables from MCP server resources
                        make_vars = true,
                        -- Create slash commands for prompts
                        make_slash_commands = true,
                    }
                }
            })
        end,
    }
}
