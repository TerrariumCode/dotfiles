return {

    -- Java
    {
        'nvim-java/nvim-java',
        config = true,
        dependencies = {
            'nvim-java/lua-async-await',
            'nvim-java/nvim-java-refactor',
            'nvim-java/nvim-java-core',
            'nvim-java/nvim-java-test',
            'nvim-java/nvim-java-dap',
            'MunifTanjim/nui.nvim',
            'neovim/nvim-lspconfig',
            'mfussenegger/nvim-dap',
            {
                'williamboman/mason.nvim',
                opts = {
                    registries = {
                        'github:nvim-java/mason-registry',
                        'github:mason-org/mason-registry',
                    },
                },
            }
        },
    },

    -- LSP-Zero
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

    -- Mason installs and manages LSP servers, DAP servers, linters, and formatters
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
                    { name = "buffer",  keyword_length = 3 },
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
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    -- ['<Tab>'] = vim.NIL,
                    -- ['<S-Tab>'] = vim.NIL,
                }),
            })

            cmp.setup.filetype({ "sql" }, {
                sources = {
                    { name = "vim-dadbod-completion" },
                    { name = "buffer" },
                }
            })
        end,
    },

    {
        'mrcjkb/rustaceanvim',
        version = '^4', -- Recommended
        lazy = false,   -- This plugin is already lazy
        dependencies = {
            "nvim-lua/plenary.nvim",
            "mfussenegger/nvim-dap",
        },
        ft = { "rust" },
    },

    {
        "saecki/crates.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "jose-elias-alvarez/null-ls.nvim",
        },
        config = function()
            local null_ls = require("null-ls")
            require("crates").setup({
                null_ls = {
                    enabled = true,
                    name = "crates.nvim",
                },
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
            { "b0o/schemastore.nvim" },
        },
        config = function()
            -- This is where all the LSP shenanigans will live
            local lsp_zero = require("lsp-zero")
            local lspconfig = require("lspconfig")
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                lsp_zero.default_keymaps({ buffer = bufnr, exclude = { "<F2>", "<F3>" } })

                local opts = { buffer = bufnr }
                vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
                vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>",
                    opts)
                vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
                vim.keymap.set("n", "gR", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
                vim.keymap.set("n", "gF", "<cmd>lua vim.lsp.buf.format()<cr>", opts)
            end)

            vim.g.rustaceanvim = {
                server = {
                    capabilities = lsp_zero.get_capabilities(),
                    settings = {
                        ["rust-analyzer"] = {
                            cargo = {
                                features = "all",
                            },
                        },
                    },
                },
            }

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "jdtls",
                    "jsonls",
                    "lua_ls",
                    "pyright",
                    "ruff",
                    "rust_analyzer",
                    "terraformls",
                    "tsserver",
                    "yamlls",
                },
                handlers = {
                    lsp_zero.default_setup,
                    rust_analyzer = lsp_zero.noop,
                    jdtls = function ()
                        require('java').setup()
                        require('lspconfig').jdtls.setup({})
                    end,
                    lua_ls = function()
                        -- (Optional) Configure lua language server for neovim
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require("lspconfig").lua_ls.setup(lua_opts)
                    end,
                },
            })

            local on_attach = function(client, bufnr)
                if client.name == 'ruff' then
                    -- Disable hover in favor of Pyright
                    client.server_capabilities.hoverProvider = false
                end
            end

            lspconfig.ruff.setup {
                on_attach = on_attach,
            }

            lspconfig.pyright.setup({
                on_init = function(client)
                    client.server_capabilities.semanticTokensProvider = nil
                end,
                settings = {
                    pyright = {
                        -- Using Ruff's import organizer
                        disableOrganizeImports = true,
                    },
                },
            })

            lspconfig.jsonls.setup({
                settings = {
                    json = {
                        schemas = require('schemastore').json.schemas(),
                        validate = { enable = true },
                    },
                },
            })

            lspconfig.yamlls.setup({
                settings = {
                    yaml = {
                        schemaStore = {
                            -- You must disable built-in schemaStore support if you want to use
                            -- this plugin and its advanced options like `ignore`.
                            enable = false,
                            -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                            url = "",
                        },
                        schemas = require('schemastore').yaml.schemas(),
                    },
                },
            })

            lspconfig.helm_ls.setup {
                settings = {
                    ['helm-ls'] = {
                        yamlls = {
                            path = "yaml-language-server",
                        }
                    }
                }
            }
        end,
    },

}
