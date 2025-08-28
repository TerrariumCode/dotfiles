return {

    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            {
                "franco-ruggeri/codecompanion-spinner.nvim",
                opts = {},
            },
        },
        opts = {
            adapters = {
                http = {
                    copilot = function()
                        return require("codecompanion.adapters").extend("copilot", {
                            schema = {
                                model = {
                                    default = "claude-3.7-sonnet",
                                },
                            },
                        })
                    end,
                    llama3 = function()
                        return require("codecompanion.adapters").extend("ollama", {
                            name = "llama3", -- Give this adapter a different name to differentiate it from the default ollama adapter
                            schema = {
                                model = {
                                    default = "llama3:latest",
                                },
                                num_ctx = {
                                    default = 16384,
                                },
                                num_predict = {
                                    default = -1,
                                },
                            },
                        })
                    end,
                    qwen3 = function()
                        return require("codecompanion.adapters").extend("ollama", {
                            name = "qwen3", -- Give this adapter a different name to differentiate it from the default ollama adapter
                            schema = {
                                model = {
                                    default = "qwen3:latest",
                                },
                                num_ctx = {
                                    default = 16384,
                                },
                                num_predict = {
                                    default = -1,
                                },
                            },
                        })
                    end,
                    vertex = function()
                        return require("codecompanion.adapters").extend("vertex", {
                            env = {
                                project_id = "hdm-ai-dev",
                                api_key = "cmd: gcloud auth application-default print-access-token",
                            },
                            schema = {
                                model = {
                                    default = "google/gemini-2.5-pro"
                                }
                            }
                        })
                    end,
                }
            },
            strategies = {
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
        cmd = "MCPHub",              -- lazy load by default
        build = "bundled_build.lua", -- Use this and set use_bundled_binary = true in opts  (see Advanced configuration)
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
    },

    {
        'NickvanDyke/opencode.nvim',
        dependencies = {
            'folke/snacks.nvim',
        },
        ---@type opencode.Config
        opts = {
            auto_reload = true,
        },
        keys = {
            { '<leader>ot', function() require('opencode').toggle() end,                                                      desc = 'Toggle opencode', },
            { '<leader>oa', function() require('opencode').ask() end,                                                         desc = 'Ask opencode',                    mode = { 'n', 'v' }, },
            { '<leader>oA', function() require('opencode').ask('@file ') end,                                                 desc = 'Ask opencode about current file', mode = { 'n', 'v' }, },
            { '<leader>on', function() require('opencode').command('/new') end,                                               desc = 'New session', },
            { '<leader>oe', function() require('opencode').prompt('Explain @cursor and its context') end,                     desc = 'Explain code near cursor' },
            { '<leader>or', function() require('opencode').prompt('Review @file for correctness and readability') end,        desc = 'Review file', },
            { '<leader>of', function() require('opencode').prompt('Fix these @diagnostics') end,                              desc = 'Fix errors', },
            { '<leader>oo', function() require('opencode').prompt('Optimize @selection for performance and readability') end, desc = 'Optimize selection',              mode = 'v', },
            { '<leader>od', function() require('opencode').prompt('Add documentation comments for @selection') end,           desc = 'Document selection',              mode = 'v', },
            { '<leader>ot', function() require('opencode').prompt('Add tests for @selection') end,                            desc = 'Test selection',                  mode = 'v', },
        },
    },
}
