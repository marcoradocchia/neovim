local colorscheme = "gruvbox-material"

vim.opt.background = "dark"
vim.g.gruvbox_material_background = "medium"
vim.gruvbox_material_foreground = "material"
vim.g.gruvbox_material_current_word = "bold"
vim.g.gruvbox_material_transparent_background = 1

vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
vim.g.gruvbox_material_diagnostic_text_highlight = 1
vim.g.gruvbox_material_diagnostic_line_highlight = 1

vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_disable_italic_comment = 1

vim.g.gruvbox_material_better_performance = 1

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found")
  return
end
