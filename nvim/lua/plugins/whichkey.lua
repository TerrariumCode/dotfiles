return {
    "folke/which-key.nvim",
    config = function()
        local wk = require("which-key")
        wk.register({
            h = {
                name = "Harpoon",
                h = { "<CMD>lua require('harpoon.mark').add_file()<CR>", "Harpoon it!" },
                m = { "<CMD>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Menu" },
                t = { "<CMD>lua require('harpoon.term').gotoTerminal(1)<CR>", "Go to terminal [1]" },
            },
        }, { prefix = "<leader>" })

        wk.register({
            z = {
                name = "Zen Mode",
                z = { "<CMD>ZenMode<CR>", "Zen mode...mmmm" },
            },
        }, { prefix = "<leader>" })

        wk.register({
            u = {
                name = "UndoTree",
                t = { "<CMD>UndotreeToggle<CR>", "Undotree Toggle" },
            },
        }, { prefix = "<leader>" })

        wk.register({
            r = {
                name = "RustTools",
                d = { "<CMD>lua vim.cmd.RustLsp {'debuggables' }<CR>", "RustDebuggables" },
                t = { "<CMD>lua vim.cmd.RustLsp {'runnables' }<CR>", "RustRunnables" },
            },
        }, { prefix = "<leader>" })
    end
}
