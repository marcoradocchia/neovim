local options = {
  -- General --
  -- Enable/Disable features
  vimtex_fold_enabled = true,
  vimtex_format_enabled = true,
  -- Disable default indentation in favor of latexindent through null-ls
  vimtex_indent_enabled = false,
  -- Disable default insert mode mappings in favor of snippet plugin
  -- (more customizable and extensible)
  vimtex_imaps_enabled = false,
  -- Compilation --
  -- vim.g.vimtex_quickfix_open_on_warning = false
  -- Filter specific warning messages (supports vim regex)
  vimtex_quickfix_ignore_filters = {
    -- "Underfull \\hbox",
    -- "Overfull \\hbox",
  },
  -- Compiler --
  vimtex_compiler_method = "latexmk",
  vimtex_compiler_latexmk_engines = { _ = "-lualatex" },
  vimtex_compiler_latexmk = {
    build_dir = "./build",
    continuous = true,
  },
  -- Previewer --
  vimtex_view_method = "zathura",
}

for k, v in pairs(options) do
  vim.g[k] = v
end
