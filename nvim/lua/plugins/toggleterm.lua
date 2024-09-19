return {
    {
        "akinsho/toggleterm.nvim",
        opts = {
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return math.floor(0.33 * vim.o.columns)
                end
            end,
            -- there is also a keymap to open horizantal
            open_mapping = [[<c-\>]],
            hide_numbers = true,
            shade_terminals = false,
            start_in_insert = true,
            insert_mappings = true,
            persist_size = true,
            persist_mode = true,
            direction = "vertical",
            close_on_exit = true,
            shell = vim.o.shell,
        },
    },
    {
        "https://git.sr.ht/~havi/telescope-toggleterm.nvim",
        event = "TermOpen",
        requires = {
            "akinsho/nvim-toggleterm.lua",
            "nvim-telescope/telescope.nvim",
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("telescope").load_extension("toggleterm")
            local trim_spaces = true
            vim.keymap.set("v", "<space>s", function()
                require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
            end)
        end,
    },
}
