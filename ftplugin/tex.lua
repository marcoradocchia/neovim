-- Compile latex main.tex file into pdf subfolder and open zathura.
-- TODO: make this better
vim.keymap.set("n", "<leader>cl", "<cmd>!lualatex --output-dir pdf main.tex && pgrep zathura || setsid -f zathura pdf/main.pdf<CR>")
vim.opt.textwidth = 79
