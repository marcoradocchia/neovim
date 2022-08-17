local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

-- setup colors
vim.cmd("highlight! link HintText HintLine")
vim.cmd("highlight! link WarningText WarningLine")
vim.cmd("highlight! link ErrorText ErrorLine")

require("user.lsp.lsp-installer")
require("user.lsp.null-ls")
require("user.lsp.handlers").setup()
