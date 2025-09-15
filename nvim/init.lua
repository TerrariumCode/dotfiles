require("config.lazy")

require("nvim-dap-projects").search_project_config()

-- NOTE: add when this is released in newer nvim
-- vim.lsp.on_type_formatting.enable()

vim.g.trailing_whitespace_exclude_filetypes = {
    "alpha",
    "git",
    "gitcommit",
}

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        -- "bacon",
        -- "bacon-ls",
        "basedpyright",
        "cssls",
        "gopls",
        "harper_ls",
        "html",
        -- "htmx",  -- borked right now on macos
        "jsonls",
        "lua_ls",
        "marksman",
        "ruff",
        "tailwindcss",
        "terraformls",
        "taplo",
        "ts_ls",
        -- "ty",
        "yamlls",
    },
})

vim.lsp.enable({
    "bacon_ls",
    "basedpyright",
    "cssls",
    "djlint",
    "dockerls",
    "gopls",
    "harper_ls",
    "helm_ls",
    "html",
    "htmx",
    "lua_ls",
    "ruff",
    -- NOTE: allow rustaceanvim to setup
    -- "rust_analyzer",
    "taplo", -- toml
    -- TODO: reenable when ty gets better
    -- "ty",
})

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set("n", "ga", "<cmd>lua require('fzf-lua').lsp_code_actions()<cr>", opts)
        vim.keymap.set("n", "gd", "<cmd>lua require('fzf-lua').lsp_definitions({ jump1 = true })<cr>", opts)
        vim.keymap.set("n", "gh",
            "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>",
            opts
        )
        vim.keymap.set("n", "gi",
            "<cmd>lua require('tiny-inline-diagnostic').toggle()<cr>",
            opts
        )
        vim.keymap.set("n", "gr", "<cmd>lua require('fzf-lua').lsp_references({ ignore_current_line = true })<cr>", opts)
        vim.keymap.set("n", "gF", "<cmd>lua vim.lsp.buf.format()<cr>", opts)
        vim.keymap.set("n", "gR", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    end,
})

-- GO
vim.lsp.config("gopls", {
    settings = {
        completeUnimported = true,
        usePlaceholders = true,
        analyses = {
            unusedParams = true,
        },
    },
})

-- HARPER - spellchecker
vim.lsp.config("harper_ls", {
    settings = {
        ["harper-ls"] = {
            linters = {
                SentenceCapitalization = false,
                SpellCheck = false
            }
        }
    }
})

-- HELM
vim.lsp.config("helm_ls", {
    settings = {
        ['helm-ls'] = {
            yamlls = {
                path = "yaml-language-server",
            }
        }
    }
})

-- HTML
vim.lsp.config("html", {
    capabilities = {
        textDocument = {
            completion = {
                completionItem = {
                    snippetSupport = true,
                },
            },
        },
    },
})

-- JSON
vim.lsp.config("jsonls", {
    settings = {
        json = {
            schemas = require('schemastore').json.schemas {
                select = {
                    '.eslintrc',
                    'package.json',
                },
            },
            validate = { enable = true },
        },
    },
})

-- LUA
vim.lsp.config("lua_ls", {
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
                    'require',
                    'Snacks'
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
})

-- PYTHON
vim.lsp.config("basedpyright", {
    -- NOTE: may not be needed when this feature is released (up top)
    -- capabilities = {
    --     textDocument = {
    --         onTypeFormatting = {
    --             dynamicRegistration = true,
    --         },
    --     },
    -- },
    settings = {
        basedpyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
            -- investigate slowdown
            reportImportCycles = false,
            typeCheckingMode = "recommended",
        },
        python = {
            analysis = {
                ignore = { "*" },
            },
        },
    },
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil then
            return
        end
        if client.name == "ruff" then
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
        end
    end,
    desc = "LSP: Disable hover capability from Ruff",
})

-- RUST
vim.lsp.config("bacon_ls", {
    init_options = {
        updateOnSave = true,
        runBaconInBackground = true,
    }
})

-- NOTE: using rustaceanvim instead
-- vim.lsp.config("rust_analyzer", {
--     settings = {
--         ['rust-analyzer'] = {
--             cargo = {
--                 buildScripts = {
--                     enable = true,
--                 },
--                 features = "all",
--             },
--             checkOnSave = {
--                 enable = false,
--             },
--             diagnostics = {
--                 enable = false,
--             },
--             procMacro = {
--                 enabled = true,
--             },
--         },
--     }
-- })

vim.g.rustaceanvim = function()
    local cfg = require('rustaceanvim.config')
    return {
        dap = {},
        -- LSP configuration
        server = {
            default_settings = {
                -- rust-analyzer language server configuration
                ['rust-analyzer'] = {
                    cargo = {
                        buildScripts = {
                            enable = true,
                        },
                        features = "all",
                    },
                    checkOnSave = {
                        enable = true,
                    },
                    diagnostics = {
                        enable = true,
                    },
                    procMacro = {
                        enabled = true,
                    },
                },
            },
        },
        -- Plugin configuration
        tools = {},
    }
end

-- YAML
vim.lsp.config("yamlls", {
    settings = {
        yaml = {
            schemaStore = {
                -- You must disable built-in schemaStore support if you want to use
                -- this plugin and its advanced options like `ignore`.
                enable = false,
                -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                url = "",
            },
            schemas = require('schemastore').yaml.schemas()
        },
    },
})

vim.filetype.add({
  extension = {
    ['http'] = 'http',
  },
})
