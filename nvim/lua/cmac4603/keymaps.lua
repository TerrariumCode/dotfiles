-- Shorten function name
local keymap = vim.api.nvim_set_keymap
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)

keymap("n", "<leader>y", "\"+y", { noremap = true })

keymap("n", "<leader>c", ":bp<bar>sp<bar>bn<bar>bd<CR>", { noremap = true, silent = true })
keymap("n", "<C-S>s", ":vert sb", { noremap = true, silent = true })

keymap("t", "<C-\\><C-\\>", "<C-\\><C-n>", { noremap = true })

keymap("n", "<C-s>", ":w<CR>", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("i", "<C-s>", "<ESC>:w<CR>", opts)

keymap("", "<Up>", "<Nop>", { noremap=true, silent=true })
keymap("", "<Down>", "<Nop>", { noremap=true, silent=true })
keymap("", "<Left>", "<Nop>", { noremap=true, silent=true })
keymap("", "<Right>", "<Nop>", { noremap=true, silent=true })
-- keymap("n", "<Space>", "<Nop>", { noremap=true, silent=true })

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap('n', '<S-h>', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true })
keymap('n', '<S-l>', '<Cmd>BufferNext<CR>', { noremap = true, silent = true })

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files find_command=rg,--ignore,--hidden,--files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep find_command=rg,--ignore,--hidden,--files<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', opts)

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
-- DAP Python
keymap("n", "<leader>dn", "<cmd>lua require('dap-python').test_method()<cr>", opts)
keymap("n", "<leader>df", "<cmd>lua require('dap-python').test_class()<cr>", opts)
keymap("v", "<leader>ds", "<esc><cmd>lua require('dap-python').debug_selection()<cr>", opts)

-- Lsp
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
-- keymap('n', 'gD', "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap('n', 'gd', "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
-- keymap('n', 'K', "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
-- keymap('n', 'gi', "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
-- keymap('n', '<C-k>', "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
-- keymap('n', '<space>wa', "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
-- keymap('n', '<space>wr', "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
-- keymap('n', '<space>D', "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
-- keymap('n', '<space>rn', "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
-- keymap('n', '<space>ca', "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
keymap('n', 'gr', "<cmd>lua vim.lsp.buf.references()<CR>", opts)

keymap("n", "<leader>cv", "<cmd>lua require('nvim-preview-csv').preview()<cr>", opts)
