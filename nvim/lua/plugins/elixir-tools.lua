return {
    "elixir-tools/elixir-tools.nvim",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local elixir = require("elixir")
        local elixirls = require("elixir.elixirls")

        elixir.setup {
            nextls = {
                enable = true,
                cmd = "/home/cmac4603/.local/share/nvim/mason/packages/nextls/next_ls_linux_amd64",
            },
            elixirls = {
                enable = true,
                cmd = "/home/cmac4603/.local/share/nvim/mason/packages/elixir-ls/language_server.sh",
                settings = elixirls.settings {
                    dialyzerEnabled = false,
                    enableTestLenses = false,
                },
                on_attach = function(client, bufnr)
                    vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
                    vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
                    vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
                end,
            },
            projectionist = {
                enable = true
            }
        }
    end,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
}
