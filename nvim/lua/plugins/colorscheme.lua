return {
    "glepnir/zephyr-nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {},
    config = function()
        vim.cmd.colorscheme 'zephyr'
        vim.g.zephyr_disable_toggle_style = 1
        vim.g.zephyr_cursor = "lCursor"
        vim.g.zephyr_italic = 1
        vim.g.zephyr_italic_comment = 1
        vim.g.zephyr_italic_keyword = 1
        vim.g.zephyr_italic_function = 1
        vim.g.zephyr_italic_variable = 1
        vim.g.zephyr_italic_string = 1
        vim.g.zephyr_italic_number = 1
        vim.g.zephyr_italic_boolean = 1
        vim.g.zephyr_italic_constant = 1
        vim.g.zephyr_italic_class = 1
        vim.g.zephyr_italic_operator = 1
        vim.g.zephyr_italic_exception = 1
        vim.g.zephyr_italic_preproc = 1
    end
}
-- return {
--     "philosofonusus/morta.nvim",
--     name = 'morta',
--     priority = 1000,
--     opts = {},
--     config = function()
--         vim.cmd.colorscheme 'morta'
--     end,
-- }
