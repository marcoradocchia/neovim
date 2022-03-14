local snip_status_ok, indentblankline = pcall(require, "indent_blankline")
if not snip_status_ok then
	return
end

local colors = COLORS

vim.cmd(string.format("highlight IndentBlanklineContextStart guisp=%s gui=bold", colors.red))
vim.cmd(string.format("highlight IndentBlanklineContextChar guifg=%s guisp=%s gui=bold", colors.red, colors.red))

indentblankline.setup({
	use_treesitter = true, -- WARNING: causing variety of issues
	show_current_context = true,
	show_current_context_start = true,
	context_patterns = {
		"class",
    "function",
		"return",
		"method",
		"if",
		"for",
		"while",
		"object",
		"array",
		"list",
		"table",
		"with",
		"try",
		"case",
		"dictionary",
		"arguments",
		"import",
    -- latex
    -- "equation",
	},
	filetype_exclude = {
		"help",
		"man",
		"txt",
		"packer",
		"NvimTree",
		"null-ls-info",
		"dashboard",
		"alpha",
		"lspinfo",
		"lsp-installer",
	},
	buftype_exclude = { "terminal" },
})
