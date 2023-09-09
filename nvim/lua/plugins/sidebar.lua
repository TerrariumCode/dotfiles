return {
   'sidebar-nvim/sidebar.nvim',
    config = function()
        -- This is where you modify the settings for lsp-zero
        -- Note: autocompletion settings will not take effect


        local function get_harpoon_files()
            local harpoon = require('harpoon')
            local file_list = {}
            for i, mark in ipairs(harpoon.get_mark_config().marks) do
                if mark.filename then
                    table.insert(file_list, string.format("%d. %s", i, mark.filename))
                end
            end
            return file_list
        end


        local harpoon_files_section = {
            title = "Harpooned",
            icon = '',
            draw = function()
                return { lines = get_harpoon_files() }
            end,
        }

        require('sidebar-nvim').setup({
            open = true,
            sections = { "files", "git", "diagnostics", "todos", harpoon_files_section },
            ["git"] = {
                icon = "",
            },
            ["diagnostics"] = {
                icon = "",
            },
            todos = {
                icon = "",
                ignored_paths = {'~'}, -- ignore certain paths, this will prevent huge folders like $HOME to hog Neovim with TODO searching
                initially_closed = false, -- whether the groups should be initially closed on start. You can manually open/close groups later.
            },
            -- containers = {
            --     icon = "",
            --     use_podman = false,
            --     attach_shell = "/bin/sh",
            --     show_all = true, -- whether to run `docker ps` or `docker ps -a`
            --     interval = 5000, -- the debouncer time frame to limit requests to the docker daemon
            -- },
            files = {
                icon = "",
                show_hidden = true,
                ignored_paths = {"%.git$"},
            },
        })
    end
}
