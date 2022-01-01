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

-- Navigate buffers
kmap('n', '<S-l>', ':bnext<CR>', opts)
kmap('n', '<S-h>', ':bprevious<CR>', opts)

-- Visual --
-- Stay in indent mode
kmap('v', '<', '<gv', opts)
kmap('v', '>', '>gv', opts)

-- Move text up and down
kmap('v', '<A-j>', ':m .+1<CR>==', opts)
kmap('v', '<A-k>', ':m .-2<CR>==', opts)
kmap('v', 'p', '"_dP', opts)

-- Visual Block --
-- Move text up and down
kmap('x', 'J', ":move '>+1<CR>gv-gv", opts)
kmap('x', 'K', ":move '<-2<CR>gv-gv", opts)
kmap('x', '<A-j>', ":move '>+1<CR>gv-gv", opts)
kmap('x', '<A-k>', ":move '<-2<CR>gv-gv", opts)

-- No Highlighting --
kmap('n', '<leader>h', ':noh<CR>', opts)

-- Terminal --
-- Better terminal navigation
kmap('t', '<C-k>', '<C-\\><C-N><C-w>k', term_opts)
kmap('t', '<C-l>', '<C-\\><C-N><C-w>l', term_opts)
kmap('t', '<C-h>', '<C-\\><C-N><C-w>h', term_opts)
kmap('t', '<C-j>', '<C-\\><C-N><C-w>j', term_opts)

-- Telescope --
-- kmap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
kmap('n', '<leader>f', "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy())<CR>", opts)

-- LSP --
-- go to next lsp diagnostic
kmap('n', '<leader>p', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
kmap('n', '<leader>n', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
