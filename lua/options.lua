local options = {
  title = true, -- sets window title
  backup = false, -- creates a backup file
  clipboard = "unnamedplus", -- access the system clipboard
  cmdheight = 1, -- controls the space in the command line
  completeopt = { -- mostly just for cmp
    "menuone",
    "noselect",
  },
  conceallevel = 0, -- disables conceal in all filetypes
  fileencoding = "utf-8", -- the encoding written to a file
  hlsearch = true, -- highlight all matches on search pattern
  incsearch = true, -- incremental search
  ignorecase = true, -- ignore case in search patterns
  mouse = "a", -- allows mouse usage
  pumheight = 10, -- popup menu height
  showmode = false, -- don't display things like --INSERT--
  showtabline = 0, -- 2: always show tabs
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smart
  splitright = true, -- force vertical splits right
  splitbelow = true, -- force horizontal splits below
  swapfile = false, -- create swapfile
  termguicolors = true, -- set term gui colors
  timeoutlen = 1000, -- ms wait for mapped sequence to complete
  undofile = true, -- enable persistent undo (~/.local/share/)
  updatetime = 50, -- faster completion (default 400ms)
  writebackup = false, -- if file is being edited don't allow edit
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- number of spaces inserted for indent
  tabstop = 2, -- spaces for each tab
  cursorline = true, -- highlight current line
  colorcolumn = { 80 }, -- hightlight column
  number = true, -- set numbered lines
  relativenumber = true, -- set lines numbers relative to current
  numberwidth = 4, -- set number column width (default 4)
  signcolumn = "yes", -- always show sign column
  wrap = false, -- wrap lines
  scrolloff = 5, -- min number of lines to keep above/below
  sidescrolloff = 5, -- min number of lines to keep right/left
  laststatus = 3, -- global statusline
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- avoid showing extra messages when using completion
vim.opt.shortmess:append("c")
vim.opt.iskeyword:append("-")
vim.opt.whichwrap:append("<,>,[,],h,l")
