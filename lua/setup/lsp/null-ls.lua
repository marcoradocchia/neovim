local null_ls = require("null-ls")
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  debug = false,
  sources = {
    formatting.prettier.with({
      args = {
        "--single-quote",
        "--jsx-single-quote",
      },
    }),
    formatting.black.with({
      args = {
        "--line-length",
        "79",
        "--fast",
      },
    }),
    formatting.latexindent,
    formatting.clang_format.with({
      args = {
        "--style=Mozilla",
      },
    }),
    formatting.rustfmt.with({
      args = {
        "--edition", "2021"
      }
    }),
    formatting.shfmt.with({
      args = {
        "-ci", "-fn", "-i", "2"
      }
    }),
    diagnostics.flake8.with({
      args = {
        "--ignore=E402,E203,W503"
      }
    }),
  },
})
