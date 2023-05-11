local cmp = require("cmp")
local luasnip = require("luasnip")

--   פּ ﯟ   some other good icons
-- find more here: https://www.nerdfonts.com/cheat-sheet
local kind_symbols = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "פּ",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

-- Sources menu symbols
local menu_symbols = {
  nvim_lsp = "[LSP]",
  nvim_lua = "[NVIM]",
  luasnip = "[SNIP]",
  buffer = "[BUF]",
  path = "[PATH]",
  neorg = "[NEORG]",
}

cmp.setup({
  -- use luasnip to expand snippets in completion list
  snippet = {
    expand = function(args) luasnip.lsp_expand(args.body) end, -- luasnip
  },
  mapping = {
    -- ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
    ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-e>"] = cmp.mapping(cmp.mapping.abort(), { "i", "c" }),
    ["<C-l>"] = cmp.mapping(function()
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      end
    end, { "i", "s" }),
    ["<C-h>"] = cmp.mapping(function()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { "i", "s" }),
  },
  -- formatting options
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- this concatonates the icon with the name of the item kind
      vim_item.kind = string.format("%s %s", kind_symbols[vim_item.kind], vim_item.kind)
      vim_item.menu = menu_symbols[entry.source.name]
      return vim_item
    end,
  },
  -- sources list
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
    { name = "neorg" },
    { name = "crates" },
  },
  confirm_opts = {
    select = true,
    behavior = cmp.ConfirmBehavior.Replace,
  },
  window = {
    completion = {
      scrollbar = true,
    },
    documentation = {
      scrollbar = true,
    },
  },
  -- experimental = {
  --   ghost_text = true,
  -- },
})

-- command line configurations
cmp.setup.cmdline("/", {
  sources = {
    { name = "buffer" },
  },
})

cmp.setup.cmdline(":", {
  sources = cmp.config.sources({
    { name = "cmdline" },
    { name = "path" },
    { name = "buffer" },
  }),
})
