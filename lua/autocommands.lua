vim.api.nvim_create_autocmd("FileType", {
  pattern = { "rust", "tex" },
  callback = function()
    local filetypes = {
      tex = { 80 },
      rust = { 99 },
    }

    vim.opt.colorcolumn = filetypes[vim.fn.expand("<amatch>")]
  end,
  desc = "Set colorcolumn according to filetype.",
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.pde",
  callback = function()
    vim.opt.filetype = "java"
  end,
  desc = "Set filetype to 'java' for Processing source files (*.pde).",
})
