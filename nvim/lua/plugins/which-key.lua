return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
    config = function()
        local wk = require("which-key")
        local harpoon = require("harpoon")

        wk.add({
            { "<leader>a",  group = "AI" },
            { "<leader>aa", "<CMD>CodeCompanionActions<CR>",     desc = "Actions",             mode = { "n", "v" } },
            { "<leader>ae", "<CMD>CodeCompanion /explain<CR>",   desc = "Explain Code",        mode = { "n", "v" } },
            { "<leader>ac", "<CMD>CodeCompanionChat<CR>",        desc = "Open Chat" },
            { "<leader>ag", "<CMD>CodeCompanion /commit<CR>",    desc = "Commit Message" },
            { "<leader>am", "<CMD>MCPHub<CR>",                   desc = "Open MCPHub",         mode = { "n" } },
            { "<leader>at", "<CMD>CodeCompanionChat Toggle<CR>", desc = "Toggle" },
            { "<leader>au", "<CMD>CodeCompanion /unittests<CR>", desc = "Generate Unit Tests", mode = { "n", "v" } },
        })

        wk.add({
            { "<leader>f",  group = "Fzflua" },
            { "<leader>fb", "<CMD>FzfLua buffers<CR>",                                     desc = "Find buffers" },
            { "<leader>ff", "<CMD>FzfLua frecency files cwd_only=true all_files=true<CR>", desc = "Find files" },
            { "<leader>fg", "<CMD>FzfLua global<CR>",                                     desc = "Global Picker [$buffers|@lsp_symbols(currbuffer)|#lsp_symbols(cwd)]" },
            { "<leader>fn", "<CMD>ObsidianDailies<CR>",                                    desc = "Find obsidian dailies" },
            { "<leader>fs", "<CMD>ScratchList<CR>",                                        desc = "Find scratch" },
            { "<leader>ft", "<CMD>FzfLua grep<CR>",                                        desc = "Find text" },
            { "<leader>fw", "<CMD>FzfLua grep_cword<CR>",                                  desc = "Find word under cursor" },
        })

        wk.add({
            { "<leader>g",  group = "Git" },
            { '<leader>ga', '<cmd>Pipeline<cr>',                           desc = 'Open GitHub Actions Pipelines' },
            { "<leader>gb", "<CMD>BlameToggle window<CR>",                 desc = "Git Blame Window" },
            { "<leader>gd", "<CMD>AdvancedGitSearch diff_commit_file<CR>", desc = "Git Diff Commit File Search" },
            { "<leader>gf", "<CMD>AdvancedGitSearch<CR>",                  desc = "Find Git Commits That Changed The Current File" },
            { "<leader>gg", function() Snacks.lazygit() end,               desc = "Lazygit" },
            { "<leader>go", function() Snacks.gitbrowse() end,             desc = "Open Remote Git URL" },
        })

        wk.add({
            { "<leader>h",  group = "Harpoon" },
            { "<leader>hh", function() harpoon:list():add() end,                         desc = "Harpoon it!" },
            { "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Menu" },
        })

        wk.add({
            { "<leader>m",  group = "Markdown" },
            { "<leader>mt", "<CMD>RenderMarkdown toggle<CR>",       desc = "Split Toggle" },
        })

        wk.add({
            { "<leader>.", "<CMD>Scratch<CR>", desc = "Open Daily Scratch" },
        })

        wk.add({
            { "<leader>u",  group = "UndoTree" },
            { "<leader>ut", "<CMD>UndotreeToggle<CR>", desc = "Toggle" },
        })

        wk.add({
            { "<leader>d",  group = "Debugger" },
            { "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle Breakpoint" },
            { "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", desc = "Continue" },
            { "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", desc = "Step Into" },
            { "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", desc = "Step Over" },
            { "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", desc = "Step Out" },
            { "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", desc = "Toggle REPL" },
            { "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", desc = "Run Last" },
            { "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", desc = "Toggle UI" },
            { "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", desc = "Terminate" },
            { "<leader>dn", "<cmd>lua require('dap-python').test_method()<cr>", desc = "Python Test Method" },
            { "<leader>df", "<cmd>lua require('dap-python').test_class()<cr>", desc = "Python Test Class" },
            { "<leader>ds", "<cmd>lua require('dap-python').debug_selection()<cr>", desc = "Python Debug Selection", mode = "v" },
        })

        -- random assortment
        wk.add({
            { "<leader>oo",  "<CMD>silent !tmux-sessionizer -s 0 --vsplit<CR>", desc = "Open Opencode In New Tmux Pane" },
            { "<leader>csv", "<CMD>CsvViewToggle<CR>",                          desc = "Toggle CSV View" },
            { "<leader>ht",  ":Hardtime toggle<CR>",                            desc = "Hardtime Toggle" },
            { "<leader>l",   function() Snacks.notifier.show_history() end,     desc = "Show notification history (logs)" },
            { "<leader>z",   "<CMD>ZenMode<CR>",                                desc = "Zen Toggle" },
        })
    end
}
