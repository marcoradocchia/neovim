local servers = {
  bashls = {},
  clangd = {},
  cmake = {},
  cssls = {},
  fortls = {},
  html = {},
  jdtls = {},
  jsonls = {},
  lemminx = {},
  ltex = {
    ltex = { checkFrequency = "save" },
  },
  pyright = {},
  rust_analyzer = {},
  sumneko_lua = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      completion = { callSnippet = "Both" },
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      hint = { enable = true },
    },
  },
  taplo = {},
  texlab = {},
  tsserver = {},
  yamlls = {},
}

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "ﯧ" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, {
    texthl = sign.name,
    text = sign.text,
    numhl = sign.name,
  })
end

vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
})

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = "LSP: " .. desc
    end

    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
  end

  nmap("<leader>rn", vim.lsp.buf.rename, "Rename")
  nmap("<leader>ca", vim.lsp.buf.code_action, "Code Action")
  nmap("<leader>F", vim.lsp.buf.format, "Format buffer")

  nmap("gD", vim.lsp.buf.declaration, "Go to Declaration")
  nmap("gd", require("telescope.builtin").lsp_definitions, "Go to Definition")
  nmap("<leader>d", require("telescope.builtin").lsp_type_definitions, "Type Definition")
  nmap("gr", require("telescope.builtin").lsp_references, "Goto References")
  nmap("gi", require("telescope.builtin").lsp_implementations, "Goto Implementation")
  nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
  nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols")

  nmap("K", vim.lsp.buf.hover, "Hover Documentation")
  nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

  nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "Workspace Add Folder")
  nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "Workspace Remove Folder")
  nmap("<leader>wl", function()
  end, "Workspace List Folders")
end

-- Neovim lua configuration
require("neodev").setup()

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
  ensure_installed = vim.tbl_keys(servers),
  automatic_installation = false,
})

-- nvim-cmp supports additional completion capabilities,
-- so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

mason_lspconfig.setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
  ["rust_analyzer"] = function()
    require("rust-tools").setup({
      tools = {
        inlay_hints = {
          parameter_hints_prefix = " ",
          other_hints_prefix = " ",
          highlight = "CursorLineSign",
        },
        hover_actions = { border = "solid" },
      },
      server = {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = { command = "clippy" },
            inlayHints = { locationLinks = false },
          },
        }
      },
    })
  end
})
