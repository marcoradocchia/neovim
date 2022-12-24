local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting

null_ls.setup({
  debug = false,
  sources = {
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
