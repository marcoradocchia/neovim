local colorscheme = "gruvbox-material"

vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_disable_italic_comment = 0
vim.g.gruvbox_material_transparent_background = 1
-- vim.g.gruvbox_material_visual = "reverse"
vim.g.gruvbox_material_diagnostic_text_highlight = 1
vim.g.gruvbox_material_diagnostic_line_highlight = 1
vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
vim.g.gruvbox_material_current_word = "bold"
vim.g.gruvbox_material_better_performance = 1
vim.gruvbox_material_foreground = "material"
-- Set contrast.
-- should be placed before `colorscheme gruvbox-material`.
-- Available values: 'hard', 'medium'(default), 'soft'
vim.g.gruvbox_material_background = "medium"

-- For dark version.
vim.opt.background = "dark"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found")
  return
end
