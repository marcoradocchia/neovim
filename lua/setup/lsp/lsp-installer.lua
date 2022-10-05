local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")

local servers = {
  "bashls",
  "clangd",
  "fortls",
  "html",
  "jdtls",
  "jsonls",
  "pyright",
  "rust_analyzer",
  "sumneko_lua",
  "texlab",
  "tsserver",
  "lemminx",
  "taplo",
}

lsp_installer.setup({
  ensure_installed = servers,
  automatic_installation = false,
  ui = {
    check_outdated_servers_on_open = true,
    border = "rounded",
    icons = {
      server_installed = "",
      server_pending = "",
      server_uninstalled = "",
    },
  },
})

local opts = {
  on_attach = require("setup.lsp.handlers").on_attach,
  capabilities = require("setup.lsp.handlers").capabilities,
}

for _, name in ipairs(servers) do
  local available, server = lsp_installer.get_server(name)

  if available then
    -- if language server settings are found in ./settings, then merge them in
    -- options before starting the language server
    local server_settings = string.format("setup.lsp.settings.%s", name)
    local status, server_opts = pcall(require, server_settings)
    if status then
      opts = vim.tbl_deep_extend("force", server_opts, opts)
    end

    server:on_ready(function()
      lspconfig[server.name].setup(opts)
    end)
    -- Queue the server to be installed.
    if not server:is_installed() then
      server:install()
    end
  end
end