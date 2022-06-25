local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

-- setup colors
local colors = COLORS
-- completion list colors
vim.cmd(string.format("highlight CmpItemAbbr guifg=%s", colors.comment))
vim.cmd(string.format("highlight CmpItemAbbrMatch gui=bold guifg=%s", colors.fg))
vim.cmd(string.format("highlight CmpItemAbbrMatchFuzzy gui=bolditalic guifg=%s", colors.fg))
vim.cmd(string.format("highlight CmpItemMenu guifg=%s", colors.comment))
-- scrollbar
vim.cmd(string.format("highlight PmenuSbar guifg=%s", colors.orange))
-- float colors
vim.cmd(string.format("highlight FloatBorder guifg=%s guibg=%s", colors.fg, colors.bg))
vim.cmd(string.format("highlight NormalFloat guifg=%s guibg=%s", colors.fg, colors.bg))
vim.cmd(string.format("highlight HintFloat guifg=%s guibg=%s", colors.cyan, colors.bg))
vim.cmd(string.format("highlight WarningFloat guifg=%s guibg=%s", colors.yellow, colors.bg))
vim.cmd(string.format("highlight ErrorFloat guifg=%s guibg=%s", colors.red, colors.bg))

--   פּ ﯟ   some other good icons
-- find more here: https://www.nerdfonts.com/cheat-sheet
local icons = {
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

cmp.setup({
	-- use luasnip to expand snippets in completion list
	snippet = {
		expand = function(args)
			-- For `luasnip` users.
			luasnip.lsp_expand(args.body)
		end,
	},

	mapping = {
		-- scroll completion list
		["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
		["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),

		-- scroll docs
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),

		-- accept completion
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),

		-- abort completion
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),

		-- accept currently selected item: if none selected, `select` first item
		-- set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({ select = true }),

		-- jump through snippets positions
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
			vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				nvim_lua = "[nvim]",
				luasnip = "[snip]",
				buffer = "[buff]",
				path = "[path]",
			})[entry.source.name]
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
		{ name = "calc" },
		{ name = "crates" },
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
