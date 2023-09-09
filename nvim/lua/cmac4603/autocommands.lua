vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]])
	end,
})

-- vim.api.nvim_create_autocmd('FileType', {
--   callback = function(tbl)
--     local set_offset = require('bufferline.api').set_offset
--
--     local bufwinid
--     local last_width
--     local autocmd = vim.api.nvim_create_autocmd('WinScrolled', {
--       callback = function()
--         bufwinid = bufwinid or vim.fn.bufwinid(tbl.buf)
--
--         local width = vim.api.nvim_win_get_width(bufwinid)
--         if width ~= last_width then
--           set_offset(width, 'FileTree')
--           last_width = width
--         end
--       end,
--     })
--
--     vim.api.nvim_create_autocmd('BufWipeout', {
--       buffer = tbl.buf,
--       callback = function()
--         vim.api.nvim_del_autocmd(autocmd)
--         set_offset(0)
--       end,
--       once = true,
--     })
--   end,
--   pattern = 'Neotree',
-- })

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
	callback = function()
		vim.cmd("quit")
	end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.java" },
	callback = function()
		vim.lsp.codelens.refresh()
	end,
})

-- vim.cmd[[
--     augroup NEOTREE_AUGROUP
--       autocmd!
--       au VimEnter * lua vim.defer_fn(function() vim.cmd("Neotree show left") end, 10)
--     augroup END
--   ]]

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    callback = function ()
        vim.cmd("StripTrailingWhitespace")
    end,
})
