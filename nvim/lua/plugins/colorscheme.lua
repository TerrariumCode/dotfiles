return {
    {
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            style = 'dark', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
            transparent = true,
            term_colors = true,
        },
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme onedark]])
        end,
        dependencies = {
            "delphinus/auto-cursorline.nvim",
            config = function()
                require("auto-cursorline").setup {}
            end
        },
    }
}
