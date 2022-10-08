local opts = { noremap = true, silent = true }

local kmap = vim.api.nvim_set_keymap
-- nvim_set_keymap({mode}, {lhs}, {rhs}, {*opts})

-- Map space as leader key --
kmap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes --
-- +-------------------+---+
-- | normal_mode       | n |
-- | insert_mode       | i |
-- | visual_mode       | v |
-- | visual_block_mode | x |
-- | term_mode         | t |
-- | command_mode      | c |
-- +-------------------+---+

-- Resize splits --
kmap("n", "<C-A-k>", ":resize +2<CR>", opts)
kmap("n", "<C-A-j>", ":resize -2<CR>", opts)
kmap("n", "<C-A-l>", ":vertical resize -2<CR>", opts)
kmap("n", "<C-A-h>", ":vertical resize +2<CR>", opts)

-- Visual --
-- Stay in indent mode
kmap("v", "<", "<gv", opts)
kmap("v", ">", ">gv", opts)

-- Move text up and down --
kmap("v", "<A-j>", ":m .+1<CR>==", opts)
kmap("v", "<A-k>", ":m .-2<CR>==", opts)
kmap("v", "p", '"_dP', opts)

-- Move text up and down (Visual Block) --
kmap("x", "J", ":move '>+1<CR>gv=gv", opts)
kmap("x", "K", ":move '<-2<CR>gv=gv", opts)

-- No Highlighting --
kmap("n", "<leader>h", ":noh<CR>", opts)

-- Keep line centered --
kmap("n", "n", "nzzzv", opts)
kmap("n", "N", "Nzzzv", opts)
kmap("n", "J", "mzJ`z", opts)
kmap("n", "<C-d>", "<C-d>zz", opts)
kmap("n", "<C-u>", "<C-u>zz", opts)

-- Telescope --
kmap("n", "g/", "<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find()<CR>", opts)
kmap("n", "<leader>s", "<cmd>lua require'telescope.builtin'.grep_string(require'telescope.themes'.get_cursor())<CR>",
  opts)
kmap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files()<CR>", opts)
kmap("n", "<leader>t", "<cmd>lua require'telescope.builtin'.live_grep()<CR>", opts)
kmap("n", "<leader>m", "<cmd>lua require'telescope.builtin'.man_pages()<CR>", opts)
kmap("n", "<leader>B", "<cmd>lua require'telescope.builtin'.buffers()<CR>", opts)

-- NvimTree --
kmap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
kmap("n", "<leader>n", ":NvimTreeFocus<CR>", opts)

-- Reloadsnippets --
kmap("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/user/luasnip.lua<CR>", opts)

-- Reload keymaps --
kmap("n", "<leader><leader>k", "<cmd>source ~/.config/nvim/lua/keymaps.lua<CR>", opts)
