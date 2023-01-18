local colorscheme = "bluloco"

require("bluloco").setup({
  style = "dark",
  transparent = false,
  italics = false,
  terminal = vim.fn.has("gui_running") == 1 -- bluoco colors are enabled in gui terminals per default.
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
