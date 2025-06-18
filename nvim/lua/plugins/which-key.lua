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
            { "<leader>g",  group = "Git" },
            { "<leader>gb", "<CMD>Gitsigns blame_line<CR>",    desc = "Git Blame Line" },
            { "<leader>gg", function() Snacks.lazygit() end,   desc = "Lazygit" },
            { "<leader>go", function() Snacks.gitbrowse() end, desc = "Open Remote Git URL" },
        })

        wk.add({
            { "<leader>h",  group = "Harpoon" },
            { "<leader>hh", function() harpoon:list():add() end,                         desc = "Harpoon it!" },
            { "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Menu" },
        })

        wk.add({
            { "<leader>m",  group = "Markdown" },
            { "<leader>mo", "<CMD>MarkdownPreviewToggle<CR>", desc = "Open Preview Toggle" },
            { "<leader>ms", "<CMD>Markview splitToggle<CR>",  desc = "Split Toggle" },
            { "<leader>mt", "<CMD>Markview toggle<CR>",       desc = "Split Toggle" },
        })

        wk.add({
            { "<leader>r",  group = "RustTools" },
            { "<leader>rd", "<CMD>lua vim.cmd.RustLsp {'debuggables' }<CR>", desc = "RustDebuggables" },
            { "<leader>rr", "<CMD>lua vim.cmd.RustLsp {'runnables' }<CR>",   desc = "RustRunnables" },
        })

        wk.add({
            { "<leader>.", "<CMD>Scratch<CR>", desc = "Open Daily Scratch" },
        })

        wk.add({
            { "<leader>f",  group = "Find..." },
            { "<leader>fb", ":FzfLua buffers<CR>",                                    desc = "Find Buffers" },
            { "<leader>ff", ":FzfLua files<CR>",                                      desc = "Find Files" },
            { "<leader>fd", ":FzfLua dap_commands<CR>",                               desc = "Dap Commands" },
            { "<leader>fg", ":FzfLua advanced_git_search diff_commit_file<CR>",       desc = "Find Commits in File" },
            { "<leader>fl", ":FzfLua advanced_git_search diff_commit_line<CR>",       desc = "Find Commits on Line" },
            { "<leader>fn", ":ScratchList<CR>",                                       desc = "Find Scratch" },
            { "<leader>fs", ":FzfLua toggleterm<CR>",                                 desc = "Find Terminals" },
            { "<leader>ft", ":FzfLua live_grep find_command=rg,--hidden,--files<CR>", desc = "Find Text" },
        })

        wk.add({
            { "<leader>u",  group = "UndoTree" },
            { "<leader>ut", "<CMD>UndotreeToggle<CR>", desc = "Toggle" },
        })

        -- random assortment
        wk.add({
            { "<leader>csv", "<CMD>CsvViewToggle<CR>",                      desc = "Toggle CSV View" },
            { "<leader>ht",  ":Hardtime toggle<CR>",                        desc = "Hardtime Toggle" },
            { "<leader>l",   function() Snacks.notifier.show_history() end, desc = "Show notification history (logs)" },
            { "<leader>z",   "<CMD>ZenMode<CR>",                            desc = "Zen Toggle" },
        })
    end
}
