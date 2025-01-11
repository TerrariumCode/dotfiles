return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim",              -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    lazy = false,
    opts = {
        close_if_last_window = true,
        enable_git_status = true,
        enable_diagnostics = true,
        default_component_configs = {
            container = {
                enable_character_fade = true
            },
            name = {
                trailing_slash = true,
                use_git_status_colors = true,
                highlight = "NeoTreeFileName",
            },
            git_status = {
                symbols = {
                    -- Change type
                    added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
                    modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
                    deleted   = "✖", -- this can only be used in the git_status source
                    renamed   = "󰁕", -- this can only be used in the git_status source
                    -- Status type
                    untracked = "",
                    ignored   = "",
                    unstaged  = "󰄱",
                    staged    = "",
                    conflict  = "",
                }
            },
            -- If you don't want to use these columns, you can set `enabled = false` for each of them individually
            file_size = {
                enabled = true,
                required_width = 64, -- min width of window required to show this column
            },
            type = {
                enabled = true,
                required_width = 122, -- min width of window required to show this column
            },
            last_modified = {
                enabled = true,
                required_width = 88, -- min width of window required to show this column
            },
            created = {
                enabled = true,
                required_width = 110, -- min width of window required to show this column
            },
            symlink_target = {
                enabled = false,
            },
        },
        window = {
            position = "left",
            width = 40,
        },
        filesystem = {
            window = {
                mappings = {
                    ["L"] = "open_nofocus"
                },
            },
            commands = {
                open_nofocus = function(state)
                    require("neo-tree.sources.filesystem.commands").open(state)
                    vim.schedule(function()
                        vim.cmd([[Neotree close]])
                    end)
                end,
            },
            filtered_items = {
                visible = true,
                hide_dotfiles = false,
                hide_gitignored = false,
                hide_hidden = false,
                never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
                    ".DS_Store",
                    "thumbs.db"
                },
                never_show_by_pattern = { -- uses glob style patterns
                    ".null-ls_*",
                },
            },
            follow_current_file = {
                enabled = true,
                leave_dirs_open = true,
            },
        },
        buffers = {
            follow_current_file = {
                enabled = true,     -- This will find and focus the file in the active buffer every time
                leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
            },
            group_empty_dirs = true, -- when true, empty folders will be grouped together
            show_unloaded = true,
        }
    }
}
