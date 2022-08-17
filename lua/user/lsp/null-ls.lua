local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  debug = false,
  sources = {
    formatting.prettier.with({
      extra_args = {
        "--single-quote",
        "--jsx-single-quote",
      },
    }),
    formatting.black.with({
      extra_args = {
        "--line-length",
        "79",
        "--fast",
      },
    }),
    formatting.latexindent,
    formatting.clang_format.with({
      extra_args = {
        "--style=Mozilla",
      },
    }),
    formatting.rustfmt.with({ extra_args = { "--edition", "2021" } }),
    diagnostics.flake8.with({
      extra_args = {
        "--ignore=E402,E203,W503"
      }
    }),
    --[[ formatting.stylua, ]]
  },
})
