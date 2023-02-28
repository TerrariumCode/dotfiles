local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.skip_server_setup({'rust_analyzer'})

lsp.configure('terraformls', {})
lsp.configure('yamlls', {
    settings = {
        ["yaml"] = {
            customTags = {
                "!vault",
            }
        }
    }
})

local rust_lsp = lsp.build_options('rust_analyzer', {
    settings = {
        ["rust-analyzer"] = {
            inlayHints = { locationLinks = false },
            cargo = {
              loadOutDirsFromCheck = true,
              features = "all",
            },
            checkOnSave = {
              command = "clippy",
            },
            diagnostics = {
                enable = true,
                disabled = {"unresolved-proc-macro"},
                enableExperimental = true,
            },
        --     procMacro = {
        --       enable = true,
        --     },
        --     experimental = {
        --       procAttrMacros = true,
        --     },
        },
    },
})

lsp.setup()

local extension_path = vim.env.HOME .. vim.env.VSCODE_LLDB_DIR
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'

local opts = {
    server = rust_lsp,
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path)
    },
}
-- Initialize rust_analyzer with rust-tools and other lspconfig.setup params
require('rust-tools').setup(opts)

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})

-- mason-update-all LSP servers
require('mason-update-all').setup()

-- pull in null-ls cfg
require "cmac4603.lsp.null-ls"

-- format terraform files
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = {"*.tf", "*.tfvars"},
  callback = function ()
    vim.lsp.buf.format()
  end,
})

require("fidget").setup{}
