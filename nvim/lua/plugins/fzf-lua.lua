return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        -- files = {
        --     fd_opts = "--hidden --no-ignore --follow",
        -- },
        -- grep = {
        --     rg_opts = "--hidden --no-ignore --follow",
        -- },
        previewer = "bat",
        previewers = {
            bat = {
                cmd  = "bat",
                args = "--color=always --style=numbers,changes",
            },
        },
    },
}
