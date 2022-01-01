local snip_status_ok, indentblankline = pcall(require, 'indent_blankline')
if not snip_status_ok then
  return
end

vim.cmd [[ highlight IndentBlanklineContextStart guisp=#ea6962 gui=bold ]]
vim.cmd [[ highlight IndentBlanklineContextChar guifg=#ea6962 guisp=#ea6962 gui=bold ]]

indentblankline.setup {
  use_treesitter = true,
  show_current_context = true,
  show_current_context_start = true,
  context_patterns = {
    'class',
    'function',
    'method',
    'if',
    'for',
    'while',
    'array',
    'list',
    'table',
    'itemize',
    'with',
    'try',
    'case',
    'dictionary',
  },
  filetype_exclude = { 'help', 'man', 'txt', 'packer' },
  buftype_exclude = { 'terminal' },
}