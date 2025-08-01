---@module 'snacks'
return {
    "folke/snacks.nvim",
    ---@module 'snacks'
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        dashboard = {
            enabled = true,
            preset = {
                keys = {
                    { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    { icon = " ", key = "t", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                    { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                    {
                        icon = " ",
                        key = "h",
                        desc = "Harpoon",
                        action = function()
                            local harpoon = require("harpoon")
                            harpoon.ui:toggle_quick_menu(harpoon:list())
                        end
                    },
                    { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                    { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
            },
            sections = {
                { section = "header" },
                { section = "keys",  gap = 1, padding = 1 },
                {
                    pane = 2,
                    icon = " ",
                    title = "Git Status",
                    section = "terminal",
                    enabled = true,
                    cmd = "hub status --short --branch --renames",
                    height = 5,
                    padding = 1,
                    ttl = 5 * 60,
                    indent = 3,
                },
                { section = "startup" },
            },
        },
        indent = { enabled = true },
        gitbrowse = { enabled = true },
        lazygit = { enabled = true },
        notifier = {
            enabled = true,
            timeout = 5000,
        },
        quickfile = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
        picker = { enabled = true },
        styles = {
            notification = {
                wo = { wrap = true } -- Wrap notifications
            }
        },
        zen = { enabled = true },
    },
    keys = {
        -- find
        { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>ff", function() Snacks.picker.files() end,   desc = "Find Files" },
        {
            "<leader>fF",
            function()
                Snacks.picker.files({
                    hidden = true,
                    ignored = true,
                    follow = true,
                })
            end,
            desc = "Find Files"
        },
        { "<leader>fg", function() Snacks.picker.git_files() end,             desc = "Find Git Files" },
        { "<leader>fr", function() Snacks.picker.recent() end,                desc = "Recent" },
        { "<leader>ft", function() Snacks.picker.grep() end,                  desc = "Grep" },
        -- git
        -- { "<leader>gb",      function() Snacks.picker.git_branches() end,                            desc = "Git Branches" },
        -- { "<leader>gl",      function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
        -- { "<leader>gL",      function() Snacks.picker.git_log_line() end,                            desc = "Git Log Line" },
        -- { "<leader>gs",      function() Snacks.picker.git_status() end,                              desc = "Git Status" },
        -- { "<leader>gS",      function() Snacks.picker.git_stash() end,                               desc = "Git Stash" },
        -- { "<leader>gd",      function() Snacks.picker.git_diff() end,                                desc = "Git Diff (Hunks)" },
        -- { "<leader>gf",      function() Snacks.picker.git_log_file() end,                            desc = "Git Log File" },
        -- Grep
        { "<leader>sb", function() Snacks.picker.lines() end,                 desc = "Buffer Lines" },
        { "<leader>sB", function() Snacks.picker.grep_buffers() end,          desc = "Grep Open Buffers" },
        { "<leader>sg", function() Snacks.picker.grep() end,                  desc = "Grep" },
        { "<leader>sw", function() Snacks.picker.grep_word() end,             desc = "Visual selection or word", mode = { "n", "x" } },
        -- search
        -- { '<leader>s"',      function() Snacks.picker.registers() end,                               desc = "Registers" },
        -- { '<leader>s/',      function() Snacks.picker.search_history() end,                          desc = "Search History" },
        -- { "<leader>sa",      function() Snacks.picker.autocmds() end,                                desc = "Autocmds" },
        -- { "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
        -- { "<leader>sc",      function() Snacks.picker.command_history() end,                         desc = "Command History" },
        -- { "<leader>sC",      function() Snacks.picker.commands() end,                                desc = "Commands" },
        { "<leader>sd", function() Snacks.picker.diagnostics() end,           desc = "Diagnostics" },
        { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end,    desc = "Buffer Diagnostics" },
        -- { "<leader>sh",      function() Snacks.picker.help() end,                                    desc = "Help Pages" },
        -- { "<leader>sH",      function() Snacks.picker.highlights() end,                              desc = "Highlights" },
        -- { "<leader>si",      function() Snacks.picker.icons() end,                                   desc = "Icons" },
        -- { "<leader>sj",      function() Snacks.picker.jumps() end,                                   desc = "Jumps" },
        { "<leader>sk", function() Snacks.picker.keymaps() end,               desc = "Keymaps" },
        -- { "<leader>sl",      function() Snacks.picker.loclist() end,                                 desc = "Location List" },
        { "<leader>sm", function() Snacks.picker.marks() end,                 desc = "Marks" },
        -- { "<leader>sM",      function() Snacks.picker.man() end,                                     desc = "Man Pages" },
        -- { "<leader>sp",      function() Snacks.picker.lazy() end,                                    desc = "Search for Plugin Spec" },
        -- { "<leader>sq",      function() Snacks.picker.qflist() end,                                  desc = "Quickfix List" },
        -- { "<leader>sR",      function() Snacks.picker.resume() end,                                  desc = "Resume" },
        -- { "<leader>su",      function() Snacks.picker.undo() end,                                    desc = "Undo History" },
        -- { "<leader>uC",      function() Snacks.picker.colorschemes() end,                            desc = "Colorschemes" },
        -- LSP
        { "gd",         function() Snacks.picker.lsp_definitions() end,       desc = "Goto Definition" },
        { "gD",         function() Snacks.picker.lsp_declarations() end,      desc = "Goto Declaration" },
        { "gr",         function() Snacks.picker.lsp_references() end,        nowait = true,                     desc = "References" },
        { "gI",         function() Snacks.picker.lsp_implementations() end,   desc = "Goto Implementation" },
        { "gy",         function() Snacks.picker.lsp_type_definitions() end,  desc = "Goto T[y]pe Definition" },
        { "<leader>ss", function() Snacks.picker.lsp_symbols() end,           desc = "LSP Symbols" },
        { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
    },
}
