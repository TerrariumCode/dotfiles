-- Setup keymaps for rust files with rustaceanvim
local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set(
    "n",
    "<leader>a",
    function()
        vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
        -- or vim.lsp.buf.codeAction() if you don't want grouping.
    end,
    { silent = true, buffer = bufnr }
)

vim.keymap.set(
    "n",
    "<leader>rc",
    function()
        vim.cmd.RustLsp('openCargo')
    end,
    { silent = true, buffer = bufnr }
)

vim.keymap.set(
    "n",
    "<leader>rd",
    function()
        vim.cmd.RustLsp('debuggables')
    end,
    { silent = true, buffer = bufnr }
)

vim.keymap.set(
    "n",
    "<leader>rg",
    function()
        vim.cmd.RustLsp { 'crateGraph', '[backend]', '[output]' }
    end,
    { silent = true, buffer = bufnr }
)

vim.keymap.set(
    "n",
    "<leader>rr",
    function()
        vim.cmd.RustLsp('runnables')
    end,
    { silent = true, buffer = bufnr }
)

vim.keymap.set(
    "n",
    "<leader>rs",
    function()
        vim.cmd.RustLsp('workspaceSymbol')
    end,
    { silent = true, buffer = bufnr }
)

vim.keymap.set(
    "n",
    "K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
    function()
        vim.cmd.RustLsp({ 'hover', 'actions' })
    end,
    { silent = true, buffer = bufnr }
)
