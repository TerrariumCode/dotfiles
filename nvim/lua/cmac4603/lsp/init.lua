-- pull in null-ls cfg
require "cmac4603.lsp.null-ls"

-- mason-update-all LSP servers
require('mason-update-all').setup()

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = {"*.tf", "*.tfvars"},
  callback = function ()
    vim.lsp.buf.format()
  end,
})

-- diagnostic output config
vim.diagnostic.config({
  virtual_text = true,
  update_in_insert = false,
  underline = true,
})
