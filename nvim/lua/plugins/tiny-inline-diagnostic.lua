return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    priority = 1000,
    config = function()
        require('tiny-inline-diagnostic').setup({
            preset = "powerline",
            options = {
                show_source = true,
                multilines = {
                    enabled = true,
                    always_show = true,
                },
            },
        })
        vim.diagnostic.config({ virtual_text = false })
    end
}
