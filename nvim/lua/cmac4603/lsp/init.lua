-- mason-update-all LSP servers
require('mason-update-all').setup()

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = {"*.tf", "*.tfvars"},
  callback = function ()
    vim.lsp.buf.format()
  end,
})

vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'} , {
    pattern = 'deployment.yaml',
    callback = function()
          vim.opt_local.filetype = 'helm'
    end
})

-- diagnostic output config
vim.diagnostic.config({
  virtual_text = true,
  update_in_insert = false,
  underline = true,
})

require("cmac4603.lsp.settings.jdtls")
