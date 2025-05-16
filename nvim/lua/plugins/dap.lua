return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "mfussenegger/nvim-dap-python",
        },
        config = function()
            local dap_python = require('dap-python')
            dap_python.setup('~/.virtualenvs/debugpy/bin/python')
            dap_python.test_runner = 'pytest'

            local dap = require('dap')
            dap.adapters.lldb = {
                type = 'executable',
                command = vim.env.LLDB_EXEC_PATH,
                name = 'lldb'
            }

            dap.adapters.vcl = {
                name = 'falco',
                type = 'executable',
                command = 'falco',
                args = { 'dap' },
            }
            dap.configurations.vcl = {
                {
                    type = 'vcl',
                    request = 'launch',
                    name = "Debug VCL by falco",
                    mainVCL = "${file}",
                    includePaths = { "${workspaceFolder}" },
                },
            }

            dap.configurations.rust = {
                {
                    name = 'Launch',
                    type = 'lldb',
                    request = 'launch',
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                    args = {},
                    env = function()
                        local variables = {}
                        for k, v in pairs(vim.fn.environ()) do
                            table.insert(variables, string.format("%s=%s", k, v))
                        end
                        return variables
                    end,
                },
            }
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dapui = require("dapui")
            dapui.setup({
                expand_lines = true,
                icons = { expanded = "", collapsed = "", circular = "" },
                mappings = {
                    -- Use a table to apply multiple mappings
                    expand = { "<CR>", "<2-LeftMouse>" },
                    open = "o",
                    remove = "d",
                    edit = "e",
                    repl = "r",
                    toggle = "t",
                },
                layouts = {
                    {
                        elements = {
                            { id = "scopes",      size = 0.33 },
                            { id = "breakpoints", size = 0.17 },
                            { id = "stacks",      size = 0.25 },
                            { id = "watches",     size = 0.25 },
                        },
                        size = 0.33,
                        position = "right",
                    },
                    {
                        elements = {
                            { id = "repl",    size = 0.45 },
                            { id = "console", size = 0.55 },
                        },
                        size = 0.27,
                        position = "bottom",
                    },
                },
                floating = {
                    max_height = 0.9,
                    max_width = 0.5,             -- Floats will be treated as percentage of your screen.
                    border = vim.g.border_chars, -- Border style. Can be 'single', 'double' or 'rounded'
                    mappings = {
                        close = { "q", "<Esc>" },
                    },
                },
            })

            local dap = require("dap")
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
        end,

    },

    {
        "folke/neodev.nvim",
        opts = {
            library = {
                plugins = { "nvim-dap-ui" },
                types = true
            },
        }
    },

    {
        "leoluz/nvim-dap-go",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        ft = "go",
        opts = {},
    },

}
