return {
  "epwalsh/obsidian.nvim",
  lazy = true,
  event = { "BufReadPre " .. vim.fn.expand "~" .. "/Documents/play_pop_obsidian/**.md" },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    dir = "~/Documents/play_pop_obsidian",
  },
}
