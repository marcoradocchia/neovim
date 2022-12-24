-- Map space as leader key --
vim.keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Resize splits --
vim.keymap.set("n", "<C-A-k>", ":resize +2<CR>")
vim.keymap.set("n", "<C-A-j>", ":resize -2<CR>")
vim.keymap.set("n", "<C-A-l>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-A-h>", ":vertical resize +2<CR>")

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move text up and down --
vim.keymap.set("v", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==")

-- Greatest remap ever by The Primeagen --
-- Paste preserving current register --
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Move text up and down (Visual Block) --
vim.keymap.set("x", "J", ":move '>+1<CR>gv=gv")
vim.keymap.set("x", "K", ":move '<-2<CR>gv=gv")

-- No Highlighting --
vim.keymap.set("n", "<leader>h", ":noh<CR>")

-- Keep line centered --
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Reload --
vim.keymap.set("n", "<leader><leader>s", function () vim.cmd("source"..vim.fn.expand("$XDG_CONFIG_HOME/nvim/lua/setup/luasnip.lua")) end, { desc = "Reload snippets" })
vim.keymap.set("n", "<leader><leader>k", function() vim.cmd("source"..vim.fn.expand("$XDG_CONFIG_HOME/nvim/lua/keymaps.lua")) end, { desc = "Reload keymaps" })
