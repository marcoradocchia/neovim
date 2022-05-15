-- protected call to nvim-lsp-installer
local installer_status, lsp_installer = pcall(require, "nvim-lsp-installer")
if not installer_status then
	return
end

-- protected call to lspconfig
local config_status, lspconfig = pcall(require, "lspconfig")
if not config_status then
	return
end

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
	automatic_installation = true,
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		},
	},
})

-- setup servers
for _, name in ipairs(servers) do
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}
	-- TODO: merge these options with the ones in the 'settings' subdirectory
	-- 		opts = vim.tbl_deep_extend("force", bashls_opts, opts)
	-- TODO: for clangd add the following
	-- 		opts.capabilities.offsetEncoding = { "utf-16" }

	local available, server = lsp_installer.get_server(name)
	if available then
		server:on_ready(function()
			lspconfig[server.name].setup(opts)
		end)
		-- Queue the server to be installed.
		if not server:is_installed() then
			server:install()
		end
	end
end
