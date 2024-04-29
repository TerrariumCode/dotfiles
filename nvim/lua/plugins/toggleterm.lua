return {
    {
        "akinsho/toggleterm.nvim",
        opts = {
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.35
                end
            end,
            open_mapping = [[<c-\>]],
            hide_numbers = true,
            shade_terminals = true,
            shading_factor = 2,
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
        end,
    },
}
