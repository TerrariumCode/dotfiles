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

        -- telescope function for harpoon
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
        end

        wk.add({
            { "<leader>a",  group = "AI" },
            { "<leader>aa", "<CMD>CodeCompanionActions<CR>",     desc = "Actions",             mode = { "n", "v" } },
            { "<leader>ac", "<CMD>CodeCompanion /commit<CR>",    desc = "Commit Message" },
            { "<leader>ae", "<CMD>CodeCompanion /explain<CR>",   desc = "Explain Code",        mode = { "n", "v" } },
            { "<leader>am", "<CMD>MCPHub<CR>",                   desc = "Open MCPHub",         mode = { "n" } },
            { "<leader>at", "<CMD>CodeCompanionChat Toggle<CR>", desc = "Toggle" },
            { "<leader>au", "<CMD>CodeCompanion /unittests<CR>", desc = "Generate Unit Tests", mode = { "n", "v" } },
        })

        wk.add({
            { "<leader>c",   group = "CSV" },
            { "<leader>csv", "<CMD>CsvViewToggle<CR>", desc = "Toggle CSV View" },
        })

        wk.add({
            { "<leader>g",  group = "Git" },
            { "<leader>gb", "<CMD>Gitsigns blame_line<CR>",    desc = "Git Blame Line" },
            { "<leader>gd", "<CMD>Neogit diff<CR>",            desc = "Neogit Diff" },
            { "<leader>gg", function() Snacks.lazygit() end,   desc = "Lazygit" },
            { "<leader>gl", "<CMD>Neogit log<CR>",             desc = "Neogit Log" },
            { "<leader>gn", "<CMD>Neogit<CR>",                 desc = "Neogit Open" },
            { "<leader>go", function() Snacks.gitbrowse() end, desc = "Open Remote Git URL" },
            { "<leader>gp", "<CMD>Neogit push<CR>",            desc = "Neogit Push" },
            { "<leader>gr", "<CMD>Neogit rebase<CR>",          desc = "Neogit Rebase" },
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
            { "<leader>s", "<CMD>ToggleTerm size=20 direction=horizontal name=horizontal<CR>", desc = "Toggle Right Vertical" },
            { "<leader>S", "<CMD>ToggleTerm size=80 direction=vertical name=vertical<CR>",     desc = "Toggle Down Horizontal" },
        })

        wk.add({
            { "<leader>f",  group = "Telescope" },
            { "<leader>fb", ":Telescope buffers<CR>",                                     desc = "Find Buffers" },
            { "<leader>ff", ":Telescope find_files find_command=rg,--hidden,--files<CR>", desc = "Find Files" },
            { "<leader>fg", ":Telescope advanced_git_search diff_commit_file<CR>",        desc = "Find Commits in File" },
            { "<leader>fh", function() toggle_telescope(harpoon:list()) end,              desc = "Open Harpoon Window" },
            { "<leader>fl", ":Telescope advanced_git_search diff_commit_line<CR>",        desc = "Find Commits on Line" },
            { "<leader>fn", ":ScratchList<CR>",                                           desc = "Find Scratch" },
            { "<leader>fs", ":Telescope toggleterm<CR>",                                  desc = "Find Terminals" },
            { "<leader>ft", ":Telescope live_grep find_command=rg,--hidden,--files<CR>",  desc = "Find Text" },
        })

        wk.add({
            { "<leader>u",  group = "UndoTree" },
            { "<leader>ut", "<CMD>UndotreeToggle<CR>", desc = "Toggle" },
        })

        -- random assortment
        wk.add({
            { "<leader>l", function() Snacks.notifier.show_history() end, desc = "Show notification history (logs)" },
            { "<leader>z", "<CMD>ZenMode<CR>",                            desc = "Zen Toggle" },
        })
    end
}
