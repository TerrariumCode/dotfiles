return {

    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "b0o/schemastore.nvim",

    -- Rust
    {
        'mrcjkb/rustaceanvim',
        version = '^6', -- Recommended
        lazy = false,   -- This plugin is already lazy
    },

    {
        'saecki/crates.nvim',
        tag = 'stable',
        config = function()
            require('crates').setup()
        end,
    },

    -- typescript
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

    -- vcl syntax highlighting support
    {
        'fgsch/vim-varnish',
    },

}
