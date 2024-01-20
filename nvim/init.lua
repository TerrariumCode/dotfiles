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
require("cmac4603.options")

vim.g.mapleader = " "
-- skip backwards compatibility routines and speed up loading
vim.g.skip_ts_context_commentstring_module = true

vim.g.markdown_fenced_languages = {
	"ts=typescript",
}

require("lazy").setup("plugins")
require("cmac4603.keymaps")
require("cmac4603.autocommands")
require("cmac4603.lsp")
require("cmac4603.dap")
vim.cmd([[colorscheme tokyonight-moon]])
