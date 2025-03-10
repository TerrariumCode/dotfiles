return {

    -- LSP-Zero
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v4.x",
        lazy = true,
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
            -- diagnostic output config
            vim.diagnostic.config({
                virtual_text = true,
                update_in_insert = false,
                underline = true,
            })
        end,
    },

    -- Mason installs and manages LSP servers, DAP servers, linters, and formatters
    {
        "williamboman/mason.nvim",
        lazy = false,
        opts = {}
    },

    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            {
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-nvim-lua",
                "L3MON4D3/LuaSnip",
                "saadparwaiz1/cmp_luasnip",
                "rafamadriz/friendly-snippets"
            },
        },
        config = function()
            -- here is where to configure the autocompletion settings.
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_cmp()

            local cmp = require("cmp")
            require('luasnip.loaders.from_vscode').lazy_load()
            -- custom snippets in this config
            require("luasnip.loaders.from_vscode").load({ paths = "../../snippets" })

            cmp.setup({
                sources = {
                    { name = "nvim_lsp" },
                    { name = "path" },
                    { name = "luasnip", keyword_length = 2 },
                    { name = "buffer",  keyword_length = 3 },
                    { name = "nvim_lua" },
                    { name = "crates" },
                },
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                formatting = lsp_zero.cmp_format(),
                mapping = cmp.mapping.preset.insert({
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    -- ['<Tab>'] = vim.NIL,
                    -- ['<S-Tab>'] = vim.NIL,
                    -- Jump to the next snippet placeholder
                    ['<C-n>'] = cmp.mapping(function(fallback)
                        local luasnip = require('luasnip')
                        if luasnip.locally_jumpable(1) then
                            luasnip.jump(1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    -- Jump to the previous snippet placeholder
                    ['<C-p>'] = cmp.mapping(function(fallback)
                        local luasnip = require('luasnip')
                        if luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
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

    -- Rust
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
        'saecki/crates.nvim',
        tag = 'stable',
        config = function()
            require('crates').setup()
        end,
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        cmd = { "LspInfo", "LspInstall", "LspStart" },
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            { 'williamboman/mason.nvim' },
            { "williamboman/mason-lspconfig.nvim" },
            { "b0o/schemastore.nvim" },
        },
        config = function()
            -- This is where all the LSP shenanigans will live
            local lsp_zero = require("lsp-zero")
            local lsp_defaults = require('lspconfig').util.default_config

            -- Add cmp_nvim_lsp capabilities settings to lspconfig
            -- This should be executed before you configure any language server
            lsp_defaults.capabilities = vim.tbl_deep_extend(
                'force',
                lsp_defaults.capabilities,
                require('cmp_nvim_lsp').default_capabilities()
            )

            -- LspAttach is where you enable features that only work
            -- if there is a language server active in the file
            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local opts = { buffer = event.buf }

                    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
                    vim.keymap.set("n", "gh",
                        "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>",
                        opts
                    )
                    vim.keymap.set("n", "gi",
                        "<cmd>lua require('tiny-inline-diagnostic').toggle()<cr>",
                        opts
                    )
                    vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
                    vim.keymap.set("n", "gF", "<cmd>lua vim.lsp.buf.format()<cr>", opts)
                    vim.keymap.set("n", "gR", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
                end,
            })

            require("mason").setup()
            local mason_lspconfig = require("mason-lspconfig")

            require("lspconfig").bacon_ls.setup({
                init_options = {
                    runBaconInBackground = true,
                    updateOnSave = true,
                    updateOnSaveWaitMillis = 1000,
                    updateOnChange = false,
                }
            })

            local handlers = {
                -- The first entry (without a key) will be the default handler
                -- and will be called for each installed server that doesn't have
                -- a dedicated handler.
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {}
                end,

                -- provide a dedicated handler for specific servers
                ["helm_ls"] = function()
                    require("lspconfig")["helm_ls"].setup {
                        settings = {
                            ['helm-ls'] = {
                                yamlls = {
                                    path = "yaml-language-server",
                                }
                            }
                        }
                    }
                end,

                ["jsonls"] = function()
                    require("lspconfig")["jsonls"].setup {
                        settings = {
                            json = {
                                schemas = require('schemastore').json.schemas(),
                                validate = { enable = true },
                            },
                        },
                    }
                end,

                -- lua_ls setup specifically for neovim
                ["lua_ls"] = function()
                    require("lspconfig")["lua_ls"].setup {
                        settings = {
                            Lua = {
                                runtime = {
                                    -- Tell the language server which version of Lua you're using
                                    -- (most likely LuaJIT in the case of Neovim)
                                    version = 'LuaJIT',
                                },
                                diagnostics = {
                                    -- Get the language server to recognize the `vim` global
                                    globals = {
                                        'vim',
                                        'require'
                                    },
                                },
                                workspace = {
                                    checkThirdParty = false,
                                    -- Make the server aware of Neovim runtime files
                                    library = {
                                        vim.env.VIMRUNTIME,
                                    }
                                },
                                -- Do not send telemetry data containing a randomized but unique identifier
                                telemetry = {
                                    enable = false,
                                },
                            },
                        },
                    }
                end,

                ["basedpyright"] = function()
                    require("lspconfig")["basedpyright"].setup {
                        on_init = function(client)
                            client.server_capabilities.semanticTokensProvider = nil
                        end,
                        settings = {
                            basedpyright = {
                                -- Using Ruff's import organizer
                                disableOrganizeImports = true,
                                -- investigate slowdown
                                reportImportCycles = false,
                                typeCheckingMode = "recommended",
                            },
                        },
                    }
                end,

                ["ruff"] = function()
                    local on_attach = function(client, bufnr)
                        if client.name == 'ruff' then
                            -- Disable hover in favor of basedpyright
                            client.server_capabilities.hoverProvider = false
                        end
                    end
                    require("lspconfig")["ruff"].setup {
                        on_attach = on_attach,
                    }
                end,

                ["rust_analyzer"] = function()
                    vim.g.rustaceanvim = {
                        server = {
                            capabilities = lsp_zero.get_capabilities(),
                            settings = {
                                ["rust-analyzer"] = {
                                    cargo = {
                                        buildScripts = {
                                            enable = true,
                                        },
                                        features = "all",
                                    },
                                    checkOnSave = {
                                        enable = false,
                                    },
                                    diagnostics = {
                                        enable = false,
                                    },
                                    procMacro = {
                                        enabled = true,
                                    },
                                },
                            },
                        },
                    }
                end,

                ['ts_ls'] = function()
                    -- do nothing, managed by typescript-tools
                end,

                ["yamlls"] = function()
                    require("lspconfig")["yamlls"].setup {
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
                    }
                end,
            }

            mason_lspconfig.setup({
                ensure_installed = {
                    "basedpyright",
                    "jsonls",
                    "lua_ls",
                    "marksman",
                    "ruff",
                    "rust_analyzer",
                    "tailwindcss",
                    "terraformls",
                    "ts_ls",
                    "yamlls",
                },
                handlers = handlers,
            })
        end,
    },

    {
        'pmizio/typescript-tools.nvim',
        dependencies = {
            'neovim/nvim-lspconfig',
            'nvim-lua/plenary.nvim',
        },
        ft = {
            'typescript',
            'typescriptreact',
            'typescript.tsx',
            'javascript',
            'javascriptreact',
            'javascript.jsx',
        },
        opts = {},
    },

}
