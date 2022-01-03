local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

configs.setup {
  ensure_installed = 'maintained',
  sync_install = false, -- install synchronously (only with ensure_installed)
  ignore_install = { '' }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { '' }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
    disable = { 'yaml' }
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  rainbow = {
    enable = true,
    -- disable = { 'jsx', 'cpp' }, list of languages you want to
    -- disable the plugin for max_file_lines = nil, Do not enable for
    -- files with more than n lines, int
    extended_mode = true, -- Also highlight non-bracket delimiters
    colors = {
      '#ea6962',
      '#a9b665',
      '#d8a657',
      '#7daea3',
      '#d3869b'
    }
  },
  autopairs = {
    enable = true,
  },
}
