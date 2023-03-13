return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons",
          "MunifTanjim/nui.nvim",
        },
        init = function()
            vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
        end,
        opts = {
            window = {
                  position = "left",
                  width = 35,
                  mapping_options = {
                    noremap = true,
                    nowait = true,
                  },
            },
            close_if_last_window = true,
            popup_border_style = "rounded",
            enable_git_status = true,
            enable_diagnostics = true,
            sort_case_insensitive = false,
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_by_name = {
                      "node_modules"
                    },
                    always_show = { -- remains visible even if other settings would normally hide it
                      ".gitignored",
                    },
                    never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
                      ".DS_Store",
                      "thumbs.db"
                    },
                  },
                follow_current_file = true,
                group_empty_dirs = false,
                hijack_netrw_behavior = "open_default",
                use_libuv_file_watcher = true,
            },
        },
    },
}
