local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
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
  },
})
