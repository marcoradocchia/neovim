-- Custom latex mappings.
local kmap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Compile latex main.tex file into pdf subfolder and open zathura.
-- TODO: make this better
kmap("n", "<leader>c", "<cmd>!lualatex --output-dir pdf main.tex && pgrep zathura || setsid -f zathura pdf/main.pdf<CR>", opts)

-- Spell checker for english and italian.
vim.opt.spelllang = "en,it"
vim.opt.spell = true
vim.opt.textwidth = 79
