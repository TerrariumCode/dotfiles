return {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {
        need = 0,
    },
    keys = {
      {"<leader>qs", function() require("persistence").load() end, desc = "Persistence - Load session for current directory" },
      {"<leader>qS", function() require("persistence").select() end, desc = "Persistence - Select a session to load" },
    },
}
