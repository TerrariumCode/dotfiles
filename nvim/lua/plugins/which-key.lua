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
            {"<leader>h", group="Harpoon"},
            {"<leader>hh", "<CMD>lua require('harpoon.mark').add_file()<CR>", desc = "Harpoon it!"},
            {"<leader>hm", "<CMD>lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Menu"},
            {"<leader>ht", "<CMD>lua require('harpoon.term').gotoTerminal(1)<CR>", desc = "Goto Terminal [1]"},
        })

        wk.add({
            {"<leader>z", group="Zen Mode"},
            {"<leader>zz", "<CMD>ZenMode<CR>", desc = "Toggle"},
        })

        wk.add({
            {"<leader>u", group="UndoTree"},
            {"<leader>ut", "<CMD>UndotreeToggle<CR>", desc = "Toggle"},
        })

        wk.add({
            {"<leader>r", group="RustTools"},
            {"<leader>rd", "<CMD>lua vim.cmd.RustLsp {'debuggables' }<CR>", desc = "RustDebuggables"},
            {"<leader>rr", "<CMD>lua vim.cmd.RustLsp {'runnables' }<CR>", desc = "RustRunnables"},
        })

    end
}
