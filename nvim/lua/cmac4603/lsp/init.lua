local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

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
        },
    },
})

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


local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local kind_icons = {
    Copilot = "",
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
	mapping = lsp.defaults.cmp_mappings({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<Tab>'] = vim.NIL,
        ['<S-Tab>'] = vim.NIL,
    }),
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			vim_item.kind = kind_icons[vim_item.kind]
			vim_item.menu = ({
				nvim_lsp = "",
				nvim_lua = "",
				luasnip = "",
				buffer = "",
				path = "",
				emoji = "",
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
        { name = 'nvim_lsp_signature_help' },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "crates" },
		{ name = "copilot" },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	experimental = {
		ghost_text = true,
	},
    sorting = {
      priority_weight = 2,
      comparators = {
        -- require("copilot_cmp.comparators").prioritize,

        -- Below is the default comparitor list and order for nvim-cmp
        cmp.config.compare.offset,
        -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
        cmp.config.compare.exact,
        cmp.config.compare.score,
        cmp.config.compare.recently_used,
        cmp.config.compare.locality,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      },
    },
})

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
  -- signs = true,
  -- update_in_insert = false,
  -- underline = true,
  -- severity_sort = false,
  -- float = true,
})

