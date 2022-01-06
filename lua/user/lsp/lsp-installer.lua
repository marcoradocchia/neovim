local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- autoinstalling missing servers
local servers = {
	"bashls",
	"clangd",
	"fortls",
	"html",
	"jsonls",
	"pyright",
	"sumneko_lua",
	"texlab",
	"jdtls",
	"tsserver",
}

for _, name in pairs(servers) do
	local server_is_found, server = lsp_installer.get_server(name)
	if server_is_found then
		if not server:is_installed() then
			print("Installing " .. name)
			server:install()
		end
	end
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	if server.name == "bashls" then
		local bashls_opts = require("user.lsp.settings.bashls")
		opts = vim.tbl_deep_extend("force", bashls_opts, opts)
	end

	if server.name == "clangd" then
		local clangd_opts = require("user.lsp.settings.clangd")
		opts = vim.tbl_deep_extend("force", clangd_opts, opts)
	end

	if server.name == "fortls" then
		local fortls_opts = require("user.lsp.settings.fortls")
		opts = vim.tbl_deep_extend("force", fortls_opts, opts)
	end

	if server.name == "html" then
		local html_opts = require("user.lsp.settings.html")
		opts = vim.tbl_deep_extend("force", html_opts, opts)
	end

	if server.name == "jsonls" then
		local jsonls_opts = require("user.lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server.name == "pyright" then
		local pyright_opts = require("user.lsp.settings.pyright")
		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	end

	if server.name == "sumneko_lua" then
		local sumneko_opts = require("user.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server.name == "texlab" then
		local texlab_opts = require("user.lsp.settings.texlab")
		opts = vim.tbl_deep_extend("force", texlab_opts, opts)
	end

	if server.name == "jdtls" then
		local jdtls_opts = require("user.lsp.settings.jdtls")
		opts = vim.tbl_deep_extend("force", jdtls_opts, opts)
	end

	if server.name == "tsserver" then
		local tsserver_opts = require("user.lsp.settings.tsserver")
		opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
	end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
