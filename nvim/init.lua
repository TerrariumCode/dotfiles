local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    print("Cloning lazy.nvim, let this finish before anything else...")
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require("autocommands")
require("keymaps")
require("options")

vim.g.mapleader = " "
-- skip backwards compatibility routines and speed up loading
vim.g.skip_ts_context_commentstring_module = true

vim.g.markdown_fenced_languages = {
    "ts=typescript",
}

vim.fn.sign_define(
    'DiagnosticSignError',
    { texthl = 'DiagnosticSignError', text = '', numhl = 'DiagnosticSignError' }
)

vim.fn.sign_define(
    'DiagnosticSignWarn',
    { texthl = 'DiagnosticSignWarn', text = '', numhl = 'DiagnosticSignWarn' }
)

vim.fn.sign_define(
    'DiagnosticSignHint',
    { texthl = 'DiagnosticSignHint', text = '', numhl = 'DiagnosticSignHint' }
)

vim.fn.sign_define(
    'DiagnosticSignInfo',
    { texthl = 'DiagnosticSignInfo', text = '', numhl = 'DiagnosticSignInfo' }
)

require("lazy").setup("plugins")
