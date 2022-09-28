local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

-- setup LSP colors
vim.cmd("highlight! link HintLine HintText")
vim.cmd("highlight! link WarningLine WarningText")
vim.cmd("highlight! link ErrorLine ErrorText")

require("user.lsp.lsp-installer")
require("user.lsp.null-ls")
require("user.lsp.handlers").setup()
