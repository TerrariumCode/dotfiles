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

        wk.add({
            { "<leader>g",  group = "Git" },
            { "<leader>gb", "<CMD>Gitsigns blame_line<CR>", desc = "Git Blame Line" },
            { "<leader>gd", "<CMD>Neogit diff<CR>", desc = "Neogit Diff" },
            { "<leader>gl", "<CMD>Neogit log<CR>", desc = "Neogit Log" },
            { "<leader>gn", "<CMD>Neogit<CR>", desc = "Neogit Open" },
            { "<leader>go", function() Snacks.gitbrowse() end, desc = "Open Remote Git URL" },
            { "<leader>gp", "<CMD>Neogit push<CR>", desc = "Neogit Push" },
            { "<leader>gr", "<CMD>Neogit rebase<CR>", desc = "Neogit Rebase" },
        })

        wk.add({
            { "<leader>h",  group = "Harpoon" },
            { "<leader>hh", "<CMD>lua require('harpoon.mark').add_file()<CR>",        desc = "Harpoon it!" },
            { "<leader>hm", "<CMD>lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Menu" },
            { "<leader>ht", "<CMD>lua require('harpoon.term').gotoTerminal(1)<CR>",   desc = "Goto Terminal [1]" },
        })

        wk.add({
            { "<leader>m",  group = "Markview" },
            { "<leader>mt", "<CMD>Markview splitToggle<CR>", desc = "Split Toggle" },
        })

        wk.add({
            { "<leader>r",  group = "RustTools" },
            { "<leader>rd", "<CMD>lua vim.cmd.RustLsp {'debuggables' }<CR>", desc = "RustDebuggables" },
            { "<leader>rr", "<CMD>lua vim.cmd.RustLsp {'runnables' }<CR>",   desc = "RustRunnables" },
        })

        wk.add({
            { "<leader>f",  group = "Toggleterm" },
            { "<leader>ff", ":Telescope find_files find_command=rg,--hidden,--files<CR>", desc = "Find Files" },
            { "<leader>ft", ":Telescope live_grep find_command=rg,--hidden,--files<CR>", desc = "Find Text" },
            { "<leader>fb", ":Telescope buffers<CR>", desc = "Find Buffers" },
            { "<leader>fs", ":Telescope toggleterm<CR>", desc = "Find Terminals" },
            { "<leader>fg", ":Telescope advanced_git_search diff_commit_file<CR>", desc = "Find Commits in File" },
            { "<leader>fl", ":Telescope advanced_git_search diff_commit_line<CR>", desc = "Find Commits on Line" },
        })

        wk.add({
            { "<leader>u",  group = "UndoTree" },
            { "<leader>ut", "<CMD>UndotreeToggle<CR>", desc = "Toggle" },
        })

        wk.add({
            { "<leader>z",  group = "Zen Mode" },
            { "<leader>zz", "<CMD>ZenMode<CR>", desc = "Toggle" },
        })

    end
}
