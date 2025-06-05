return {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        borderless_pickers = true,
    },
    config = function()
        vim.cmd("colorscheme cyberdream")
    end,
}
