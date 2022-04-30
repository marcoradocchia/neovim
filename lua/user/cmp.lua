local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

--   פּ ﯟ   some other good icons
-- find more here: https://www.nerdfonts.com/cheat-sheet
local kind_icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

cmp.setup({
	snippet = {
		expand = function(args)
      -- For `luasnip` users.
			luasnip.lsp_expand(args.body)
		end,
	},

	mapping = {
    -- use the default mappings to scroll through the completion list:
    ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
    ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    -- Specify `cmp.config.disable` if you want to remove the default `<C-y>`
    -- mapping.
		["<C-y>"] = cmp.config.disable,
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({ select = true }),
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

	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			-- Kind icons
			-- vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
			-- This concatonates the icons with the name of the item kind
			vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				nvim_lua = "[nvim]",
				luasnip = "[Snip]",
				buffer = "[Buff]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
	},

	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "calc" },
	},

	confirm_opts = {
    select = true,
		behavior = cmp.ConfirmBehavior.Replace,
	},

	window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
	},

	experimental = {
		ghost_text = true,
		native_menu = false,
	},
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
