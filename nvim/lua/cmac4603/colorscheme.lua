-- local colorscheme = "zephyr"
--
-- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- if not status_ok then
--   return
-- end

require('onedark').setup {
    style = 'warm'
}
require('onedark').load()
