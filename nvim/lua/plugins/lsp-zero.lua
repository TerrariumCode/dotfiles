return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    lazy = true,
    config = function()
      -- This is where you modify the settings for lsp-zero
      -- Note: autocompletion settings will not take effect

      require('lsp-zero.settings').preset({})
    end
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {'L3MON4D3/LuaSnip'},
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      -- The arguments for .extend() have the same shape as `manage_nvim_cmp`:
      -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp

      require('lsp-zero.cmp').extend()

      -- And you can configure cmp even more, if you want to.
      local cmp = require('cmp')
      local cmp_action = require('lsp-zero.cmp').action()

      cmp.setup({
        mapping = {
            ['<CR>'] = cmp.mapping.confirm({select = false}),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-f>'] = cmp_action.luasnip_jump_forward(),
            ['<C-b>'] = cmp_action.luasnip_jump_backward(),
            ['<Tab>'] = vim.NIL,
            ['<S-Tab>'] = vim.NIL,
        },
        sources = {
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
            { name = 'nvim_lsp_signature_help' },
            { name = "luasnip" },
            { name = "buffer" },
            { name = "path" },
            { name = "crates" },
            -- { name = "copilot" },
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
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
        end
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = 'LspInfo',
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'williamboman/mason-lspconfig.nvim'},
      {
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
    },
    config = function()
      local lsp = require('lsp-zero')

      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({buffer = bufnr})
      end)

      lsp.skip_server_setup({'rust_analyzer'})

      local lspconfig = require('lspconfig')

      lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

      lspconfig.yamlls.setup({
          settings = {
              yaml = {
                  customTags = {
                      "!vault",
                  },
                  keyOrdering = false
              }
          }
      })

      lsp.setup()

      -- Initialize rust_analyzer with rust-tools
      local rust_tools = require('rust-tools')
      rust_tools.setup({
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "K", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
          vim.keymap.set("n", "<leader>ca", rust_tools.code_action_group.code_action_group, { buffer = bufnr })
          local opts = { noremap = true, silent = true }
          local keymap = vim.api.nvim_buf_set_keymap
          keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
          keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
          keymap(bufnr, "n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
          keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
          keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
          keymap(bufnr, "n", "<C-K>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
          keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
          keymap(bufnr, "n", "<leader>fm", "<cmd>lua vim.lsp.buf.format( { timeout_ms = 5000  })<CR>", opts)
          keymap(bufnr, "n", "<leader>do", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
          keymap(bufnr, "n", "<leader>dp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
          keymap(bufnr, "n", "<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
          keymap(bufnr, "n", "<leader>uo", "<cmd>lua require('dapui').toggle()<CR>", opts)
          keymap(bufnr, "n", "<leader>uc", "<cmd>lua require('dapui').close()<CR>", opts)
          keymap(bufnr, "n", "<leader>un", ":DapContinue<CR>", opts)
          keymap(bufnr, "n", "<leader>ut", ":DapTerminate<CR>", opts)
          keymap(bufnr, "n", "<leader>bb", ":DapToggleBreakpoint<CR>", opts)
        end,
        server = {
          settings = {
            ['rust-analyzer'] = {
              cargo = {
                features = "all",
              }
            }
          },
          -- on_attach = function(_, bufnr)
          --   -- Hover actions
          --   vim.keymap.set("n", "<C-space>", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
          --   -- Code action groups
          --   vim.keymap.set("n", "<Leader>a", rust_tools.code_action_group.code_action_group, { buffer = bufnr })
          -- end
        }
      })

    end
  }
}
