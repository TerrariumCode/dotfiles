return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		lazy = true,
		config = false,
		init = function()
			-- Disable automatic setup, we are doing it manually
			vim.g.lsp_zero_extend_cmp = 0
			vim.g.lsp_zero_extend_lspconfig = 0
		end,
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = true,
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lua",
				"L3MON4D3/LuaSnip",
			},
		},
		config = function()
			-- here is where to configure the autocompletion settings.
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_cmp()

			local cmp = require("cmp")
			local cmp_select = { behavior = cmp.SelectBehavior.Select }

			cmp.setup({
				sources = {
					{ name = "path" },
					{ name = "nvim_lsp" },
					{ name = "nvim_lua" },
					{ name = "luasnip", keyword_length = 2 },
					{ name = "buffer", keyword_length = 3 },
					{ name = "crates" },
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				formatting = lsp_zero.cmp_format(),
				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
				}),
			})
		end,
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			-- This is where all the LSP shenanigans will live
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_lspconfig()

			lsp_zero.on_attach(function(client, bufnr)
				-- see :help lsp-zero-keybindings
				-- to learn the available actions
				lsp_zero.default_keymaps({ buffer = bufnr, exclude = { "<F2>", "<F3>" } })

				vim.keymap.set("n", "gR", "<cmd>lua vim.lsp.buf.rename()<cr>", { buffer = bufnr })
				vim.keymap.set("n", "gF", "<cmd>lua vim.lsp.buf.format()<cr>", { buffer = bufnr })
			end)

			vim.g.rustaceanvim = {
				server = {
					capabilities = lsp_zero.get_capabilities(),
				},
			}

			require("mason-lspconfig").setup({
				ensure_installed = { "tsserver", "rust_analyzer", "pyright" },
				handlers = {
					lsp_zero.default_setup,
					rust_analyzer = lsp_zero.noop,
					lua_ls = function()
						-- (Optional) Configure lua language server for neovim
						local lua_opts = lsp_zero.nvim_lua_ls()
						require("lspconfig").lua_ls.setup(lua_opts)
					end,
				},
			})
		end,
	},
}
-- return {
-- 	{
-- 		"VonHeikemen/lsp-zero.nvim",
-- 		lazy = true,
-- 		dependencies = {
-- 			"neovim/nvim-lspconfig",
-- 			"williamboman/mason.nvim",
-- 			"williamboman/mason-lspconfig.nvim",
-- 			"hrsh7th/nvim-cmp",
-- 			"hrsh7th/cmp-nvim-lsp",
-- 			"hrsh7th/cmp-buffer",
-- 			"hrsh7th/cmp-path",
-- 			"saadparwaiz1/cmp_luasnip",
-- 			"hrsh7th/cmp-nvim-lua",
-- 			"L3MON4D3/LuaSnip",
-- 			"rafamadriz/friendly-snippets",
-- 		},
-- 		config = function()
-- 			local lsp_zero = require("lsp-zero")
--
-- 			lsp_zero.on_attach(function(client, bufnr)
-- 				local opts = { buffer = bufnr, remap = false }
--
-- 				vim.keymap.set("n", "gd", function()
-- 					vim.lsp.buf.definition()
-- 				end, opts)
-- 				vim.keymap.set("n", "K", function()
-- 					vim.lsp.buf.hover()
-- 				end, opts)
-- 				vim.keymap.set("n", "<leader>vws", function()
-- 					vim.lsp.buf.workspace_symbol()
-- 				end, opts)
-- 				vim.keymap.set("n", "<leader>vd", function()
-- 					vim.diagnostic.open_float()
-- 				end, opts)
-- 				vim.keymap.set("n", "[d", function()
-- 					vim.diagnostic.goto_next()
-- 				end, opts)
-- 				vim.keymap.set("n", "]d", function()
-- 					vim.diagnostic.goto_prev()
-- 				end, opts)
-- 				vim.keymap.set("n", "<leader>vca", function()
-- 					vim.lsp.buf.code_action()
-- 				end, opts)
-- 				vim.keymap.set("n", "<leader>vrr", function()
-- 					vim.lsp.buf.references()
-- 				end, opts)
-- 				vim.keymap.set("n", "<leader>vrn", function()
-- 					vim.lsp.buf.rename()
-- 				end, opts)
-- 				vim.keymap.set("i", "<C-h>", function()
-- 					vim.lsp.buf.signature_help()
-- 				end, opts)
-- 			end)
--
-- 			require("mason").setup({})
-- 			require("mason-lspconfig").setup({
-- 				ensure_installed = { "tsserver", "rust_analyzer" },
-- 				handlers = {
-- 					lsp_zero.default_setup,
-- 					lua_ls = function()
-- 						local lua_opts = lsp_zero.nvim_lua_ls()
-- 						require("lspconfig").lua_ls.setup(lua_opts)
-- 					end,
-- 				},
-- 			})
--
-- 			local cmp = require("cmp")
-- 			local cmp_select = { behavior = cmp.SelectBehavior.Select }
--
-- 			cmp.setup({
-- 				sources = {
-- 					{ name = "path" },
-- 					{ name = "nvim_lsp" },
-- 					{ name = "nvim_lua" },
-- 					{ name = "luasnip", keyword_length = 2 },
-- 					{ name = "buffer", keyword_length = 3 },
-- 				},
-- 				formatting = lsp_zero.cmp_format(),
-- 				mapping = cmp.mapping.preset.insert({
-- 					["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
-- 					["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
-- 					["<C-y>"] = cmp.mapping.confirm({ select = true }),
-- 					["<C-Space>"] = cmp.mapping.complete(),
-- 				}),
-- 			})
-- 		end,
-- 	},
-- }
--
--     -- Autocompletion
--     {
--         'hrsh7th/nvim-cmp',
--         event = 'InsertEnter',
--         dependencies = {
--             {
--                 'L3MON4D3/LuaSnip',
--                 'FelipeLema/cmp-async-path',
--                 'saadparwaiz1/cmp_luasnip',
--                 'hrsh7th/cmp-nvim-lsp-signature-help',
--                 'hrsh7th/cmp-nvim-lsp',
--                 'hrsh7th/cmp-buffer',
--             },
--         },
--         config = function()
--             -- Here is where you configure the autocompletion settings.
--             -- The arguments for .extend() have the same shape as `manage_nvim_cmp`:
--             -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp
--
--             require('lsp-zero.cmp').extend()
--
--             -- And you can configure cmp even more, if you want to.
--             local cmp = require('cmp')
--             local cmp_action = require('lsp-zero.cmp').action()
--
--             cmp.setup({
--                 mapping = {
--                     ['<CR>'] = cmp.mapping.confirm({ select = false }),
--                     ['<C-Space>'] = cmp.mapping.complete(),
--                     ['<C-f>'] = cmp_action.luasnip_jump_forward(),
--                     ['<C-b>'] = cmp_action.luasnip_jump_backward(),
--                     ['<Tab>'] = vim.NIL,
--                     ['<S-Tab>'] = vim.NIL,
--                 },
--                 sources = {
--                     { name = "async_path" },
--                     { name = "nvim_lsp" },
--                     { name = "nvim_lua" },
--                     { name = 'nvim_lsp_signature_help' },
--                     { name = "luasnip" },
--                     { name = "buffer" },
--                     { name = "crates" },
--                 },
--                 window = {
--                     completion = cmp.config.window.bordered(),
--                     documentation = cmp.config.window.bordered(),
--                 },
--                 sorting = {
--                     priority_weight = 2,
--                     comparators = {
--
--                         -- Below is the default comparitor list and order for nvim-cmp
--                         cmp.config.compare.offset,
--                         -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
--                         cmp.config.compare.exact,
--                         cmp.config.compare.score,
--                         cmp.config.compare.recently_used,
--                         cmp.config.compare.locality,
--                         cmp.config.compare.kind,
--                         cmp.config.compare.sort_text,
--                         cmp.config.compare.length,
--                         cmp.config.compare.order,
--                     },
--                 },
--             })
--         end
--     },
--
--     -- LSP
--     {
--         'neovim/nvim-lspconfig',
--         cmd = 'LspInfo',
--         event = { 'BufReadPre', 'BufNewFile' },
--         dependencies = {
--             { 'hrsh7th/cmp-nvim-lsp' },
--             { 'williamboman/mason-lspconfig.nvim' },
--             {
--                 'williamboman/mason.nvim',
--                 build = function()
--                     pcall(vim.cmd, 'MasonUpdate')
--                 end,
--             },
--         },
--         config = function()
--             local lsp = require('lsp-zero').preset({})
--
--             lsp.on_attach(function(client, bufnr)
--                 lsp.default_keymaps({ buffer = bufnr })
--             end)
--
--             local rust_lsp = lsp.build_options('rust_analyzer', {})
--
--             local lspconfig = require('lspconfig')
--
--             lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
--
--             lspconfig.sqlls.setup({
--                 single_file_support = true,
--             })
--
--             lspconfig.yamlls.setup({
--                 settings = {
--                     yaml = {
--                         customTags = {
--                             "!vault",
--                         },
--                         keyOrdering = false
--                     }
--                 }
--             })
--
--             lsp.setup()
--
--             rust_lsp.settings = {
--                 ['rust-analyzer'] = {
--                     cargo = {
--                         features = "all",
--                     }
--                 }
--             }
--         end
--     }
-- }
