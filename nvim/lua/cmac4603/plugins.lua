local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don"t error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  git = {
    clone_timeout = 300, -- Timeout, in seconds, for git clones
  },
}

-- Install your plugins here
return packer.startup(function(use)
  use { "wbthomason/packer.nvim" }
  use { "nvim-lua/plenary.nvim" } -- Useful lua functions used by lots of plugins
  use { "numToStr/Comment.nvim" }
  use { "JoosepAlviste/nvim-ts-context-commentstring" }
  use { "kyazdani42/nvim-web-devicons" }
  use {
    "nvim-neo-tree/neo-tree.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  }
  use { "akinsho/bufferline.nvim" }
  use { "moll/vim-bbye" }
  use { "nvim-lualine/lualine.nvim" }
  use { "akinsho/toggleterm.nvim" }
  use { "lewis6991/impatient.nvim" }
  use { "lukas-reineke/indent-blankline.nvim" }
  use { "goolord/alpha-nvim" }
  use { "ThePrimeagen/harpoon" }
  use { "folke/which-key.nvim" }
  use { "folke/trouble.nvim" }
  use { "folke/todo-comments.nvim" }
  use { "ThePrimeagen/vim-be-good" }
  use {
    'saecki/crates.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
        local null_ls = require("null-ls")
        require('crates').setup {
            null_ls = {
                enabled = true,
                name = "crates.nvim",
            }
        }
    end,
  }
  use { "mbbill/undotree" }
  use { "jdhao/whitespace.nvim" }
  use { "tiagovla/scope.nvim" }
  use { "RubixDev/mason-update-all" }
  use {
    "ggandor/leap.nvim",
    requires = {
        "tpope/vim-repeat"
    }
  }
  use { "hashivim/vim-terraform" }
  use { "jeanlucthumm/nvim-lua-format" }
  use {
  "folke/zen-mode.nvim",
  config = function()
    require("zen-mode").setup {
    }
  end
  }
  use { "tpope/vim-obsession" }
  use { "asiryk/auto-hlsearch.nvim" }
  use { "j-hui/fidget.nvim" }
  use {
    "roobert/bufferline-cycle-windowless.nvim",
    requires = {
      { "akinsho/bufferline.nvim" },
    },
    setup = function()
      require("bufferline-cycle-windowless").setup({
        -- whether to start in enabled or disabled mode
        default_enabled = true,
     })
    end,
  }
  use { "tpope/vim-surround" }
  use { "chrisbra/csv.vim" }

  -- Colorschemes
  use { "glepnir/zephyr-nvim" }
  -- use {
  --   'uloco/bluloco.nvim',
  --   requires = { 'rktjmp/lush.nvim' }
  -- }
  -- use { "rebelot/kanagawa.nvim" }
  -- use { "Rigellute/shades-of-purple.vim" }
  -- use { "folke/tokyonight.nvim" }
  -- use { "lunarvim/darkplus.nvim" }

  -- lsp
  use {
    "VonHeikemen/lsp-zero.nvim",
    requires = {
      -- LSP Support
      {"neovim/nvim-lspconfig"},
      {"williamboman/mason.nvim"},
      {"williamboman/mason-lspconfig.nvim"},

      -- Autocompletion
      {"hrsh7th/nvim-cmp"},
      {"hrsh7th/cmp-buffer"},
      {"hrsh7th/cmp-path"},
      {"saadparwaiz1/cmp_luasnip"},
      {"hrsh7th/cmp-nvim-lsp"},
      {"hrsh7th/cmp-nvim-lua"},

      -- Snippets
      {"L3MON4D3/LuaSnip"},
      {"rafamadriz/friendly-snippets"},
    }
  }
  use { "simrat39/rust-tools.nvim" }
  use { "jose-elias-alvarez/null-ls.nvim" }
  use { "RRethy/vim-illuminate" }

  -- Telescope
  use { "nvim-telescope/telescope.nvim" }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    commit = "8e763332b7bf7b3a426fd8707b7f5aa85823a5ac",
  }

  -- Git
  use { "lewis6991/gitsigns.nvim" }

  -- DAP
  use { "mfussenegger/nvim-dap" }
  use { "mfussenegger/nvim-dap-python" }
  use { "rcarriga/nvim-dap-ui" }
  use { "ravenxrz/DAPInstall.nvim" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
