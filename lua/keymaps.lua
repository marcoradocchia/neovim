local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- shorten function name
-- nvim_set_keymap({mode}, {lhs}, {rhs}, {*opts})
local kmap = vim.api.nvim_set_keymap

-- map space as leader key
kmap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

-- Resize splits
kmap("n", "<C-A-k>", ":resize +2<CR>", opts)
kmap("n", "<C-A-j>", ":resize -2<CR>", opts)
kmap("n", "<C-A-l>", ":vertical resize -2<CR>", opts)
kmap("n", "<C-A-h>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
kmap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
kmap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)
kmap("n", "<S-A-l>", ":BufferLineMoveNext<CR>", opts)
kmap("n", "<S-A-h>", ":BufferLineMovePrev<CR>", opts)
kmap("n", "<leader>bp", ":BufferLinePick<CR>", opts)
kmap("n", "<leader>bcr", ":BufferLineCloseRight<CR>", opts)
kmap("n", "<leader>bcl", ":BufferLineCloseLeft<CR>", opts)

-- Visual --
-- Stay in indent mode
kmap("v", "<", "<gv", opts)
kmap("v", ">", ">gv", opts)

-- Move text up and down
kmap("v", "<A-j>", ":m .+1<CR>==", opts)
kmap("v", "<A-k>", ":m .-2<CR>==", opts)
kmap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
kmap("x", "J", ":move '>+1<CR>gv=gv", opts)
kmap("x", "K", ":move '<-2<CR>gv=gv", opts)

-- No Highlighting --
kmap("n", "<leader>h", ":noh<CR>", opts)

-- keep line centered
kmap("n", "n", "nzzzv", opts)
kmap("n", "N", "Nzzzv", opts)
kmap("n", "J", "mzJ`z", opts)
kmap("n", "<C-d>", "<C-d>zz", opts)
kmap("n", "<C-u>", "<C-u>zz", opts)

-- Terminal --
-- Better terminal navigation
kmap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
kmap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
kmap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
kmap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)

-- Telescope --
kmap("n", "g/", "<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find()<CR>", opts) -- fuzzy find in current buffer
kmap("n", "<leader>s", "<cmd>lua require'telescope.builtin'.grep_string(require'telescope.themes'.get_cursor())<CR>", opts) -- grep word under cursor in current buffer
kmap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files()<CR>", opts) -- find files
kmap("n", "<leader>t", "<cmd>lua require'telescope.builtin'.live_grep()<CR>", opts) -- live grep
kmap("n", "<leader>m", "<cmd>lua require'telescope.builtin'.man_pages()<CR>", opts) -- man pages
kmap("n", "<leader>B", "<cmd>lua require'telescope.builtin'.buffers()<CR>", opts) -- open buffers

-- NvimTree --
kmap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
kmap("n", "<leader>n", ":NvimTreeFocus<CR>", opts)

-- Buffers --
kmap("n", "<C-c>", ":Bdelete<CR>", opts)

-- reloadsnippets
kmap("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/user/luasnip.lua<CR>", opts)
-- reload keymaps
kmap("n", "<leader><leader>k", "<cmd>source ~/.config/nvim/lua/keymaps.lua<CR>", opts)