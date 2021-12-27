local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- shorten function name
-- nvim_set_keymap({mode}, {lhs}, {rhs}, {*opts})
local kmap = vim.api.nvim_set_keymap

-- map space as leader key
kmap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

-- Normal --
-- Better window navigation
kmap('n', '<C-h>', '<C-w>h', opts)
kmap('n', '<C-j>', '<C-w>j', opts)
kmap('n', '<C-k>', '<C-w>k', opts)
kmap('n', '<C-l>', '<C-w>l', opts)

-- Resize splits
kmap('n', '<C-A-k>', ':resize +2<CR>', opts)
kmap('n', '<C-A-j>', ':resize -2<CR>', opts)
kmap('n', '<C-A-l>', ':vertical resize -2<CR>', opts)
kmap('n', '<C-A-h>', ':vertical resize +2<CR>', opts)

-- Visual --
-- Stay in indent mode
kmap('v', '<', '<gv', opts)
kmap('v', '>', '>gv', opts)

-- Move text up and down
kmap('v', '<A-j>', ':m .+1<CR>==', opts)
kmap('v', '<A-k>', ':m .-2<CR>==', opts)
kmap('v', 'p', '"_dP', opts)
