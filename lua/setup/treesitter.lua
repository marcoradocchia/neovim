local configs = require("nvim-treesitter.configs")

configs.setup({
  ensure_installed = {
    "bash",
    "bibtex",
    "c",
    "cmake",
    "comment",
    "css",
    "dockerfile",
    "fortran",
    "html",
    "http",
    "java",
    "javascript",
    "json",
    "json5",
    "latex",
    "lua",
    "make",
    "markdown",
    "markdown_inline",
    "python",
    "regex",
    "rst",
    "rust",
    "scss",
    "toml",
    "typescript",
    "vim",
    "yaml"
  },
  sync_install = false, -- install synchronously (only with ensure_installed)
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    -- disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
    disable = { "python", "yaml", "c" },
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
    extended_mode = true, -- also highlight non-bracket delimiters
  },
})

-- see https://github.com/nvim-treesitter/nvim-treesitter-context
local context_ok, context = pcall(require, "treesitter-context")
if not context_ok then
  return
end

vim.cmd("highlight TreesitterContext gui=bold")
vim.cmd("highlight! link TreesitterContextLineNumber YellowBold")

context.setup({
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
    -- For all filetypes
    -- Note that setting an entry here replaces all other patterns for this entry.
    -- By setting the 'default' entry below, you can control which nodes you want to
    -- appear in the context window.
    default = {
      'class',
      'function',
      'method',
      -- 'for', -- These won't appear in the context
      -- 'while',
      -- 'if',
      -- 'switch',
      -- 'case',
    },
    -- Example for a specific filetype.
    rust = {
      'trait_item',
      'impl_item',
    },
  },
  exact_patterns = {
    -- Example for a specific filetype with Lua patterns
    -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
    -- exactly match "impl_item" only)
    -- rust = true,
  },

  -- [!] The options below are exposed but shouldn't require your attention,
  --     you can safely ignore them.

  zindex = 20, -- The Z-index of the context window
  mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
  separator = nil, -- Separator between context and content. Should be a single character string, like '-'.
})
