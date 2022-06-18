local M = {}

-- TODO: backfill this to template
M.setup = function()
	local colors = COLORS

	-- setup diagnostics highlight
	vim.cmd(string.format("highlight DiagnosticError guifg=%s", colors.red))
	vim.cmd(string.format("highlight DiagnosticWarn guifg=%s", colors.yellow))
	vim.cmd(string.format("highlight DiagnosticHint guifg=%s", colors.cyan))
	vim.cmd(string.format("highlight DiagnosticInfo guifg=%s", colors.blue))

  -- setup diagnostics symbols
	local signs = {
    { name = "DiagnosticSignError", text = ""},
    { name = "DiagnosticSignWarn", text = ""},
    { name = "DiagnosticSignHint", text = "ﯦ"},
    { name = "DiagnosticSignInfo", text = ""},
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, {
			texthl = sign.name,
			text = sign.text,
			numhl = "",
		})
	end

  -- configuration
	vim.diagnostic.config({
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  })

  -- TODO: improve this
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {
      border = "rounded",
    }
  )

  -- TODO: improve this
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
      border = "rounded",
    }
  )
end

-- document highlight
local function lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	if client.server_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
      augroup lsp_document_highlight
      autocmd! * <buffer>
      autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
			false
		)
	end
end

-- keymaps
local function lsp_keymaps(bufnr)
	local bufkmap = vim.api.nvim_buf_set_keymap
	local opts = { noremap = true, silent = true }
  bufkmap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	bufkmap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	bufkmap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	bufkmap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	bufkmap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	bufkmap(bufnr, "n", "<leader>k", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	bufkmap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	bufkmap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
	bufkmap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
	bufkmap(bufnr, "n", "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', opts)
	bufkmap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  bufkmap(bufnr, 'n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts) -- code actions
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

M.on_attach = function(client, bufnr)
  -- listing disabled ls formatters
  local disabled_formatters = {
    clangd = true,
    jdtls = true,
    rust_analyzer = true,
    tsserver = true,
  }

	-- disabling formatters from language servers, because using null-ls
	if disabled_formatters[client.name] == true then
		client.server_capabilities.document_formatting = false
	end

  -- setup document highlight
	lsp_highlight_document(client)

  -- setup buffer keymaps
	lsp_keymaps(bufnr)
end

-- make protected call to cmp_nvim_lsp to avoid destructive errors
local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return M
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
