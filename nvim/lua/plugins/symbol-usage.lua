return {
	"Wansmer/symbol-usage.nvim",
	event = "BufReadPre", -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
	config = function()
		local opts = {
			---@type 'above'|'end_of_line'|'textwidth'
			vt_position = "end_of_line",
			references = { enabled = false, include_declaration = false },
			definition = { enabled = false },
			implementation = { enabled = false },
		}
		require("symbol-usage").setup(opts)
	end,
}
