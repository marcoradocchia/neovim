local snip_status_ok, indentblankline = pcall(require, "indent_blankline")
if not snip_status_ok then
	return
end

local colors = COLORS

vim.cmd(string.format("highlight IndentBlanklineContextStart guisp=%s gui=bold", colors.red))
vim.cmd(string.format("highlight IndentBlanklineContextChar guifg=%s guisp=%s gui=bold", colors.red, colors.red))

indentblankline.setup({
	show_trailing_blankline_indent = false,
	show_end_of_line = true,
	use_treesitter = false, -- WARNING: causing issues if set to true
	show_current_context = true,
	show_current_context_start = true,
	context_patterns = {
		"class",
		"function",
		"return",
		"method",
		"if",
		"else",
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
		-- c
		"compound_statement", -- if/else
		-- python
		"expression_statement",
		-- rust
		"let_declaration",
		"match_arm",
		"match_expression",
		"field_expression",
		-- latex
		"equation",
		"environment",
		"curly_group",
		"enum_item",
		-- html
		"element",
		-- css
		"block",
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
		"checkhealth",
	},
	buftype_exclude = { "terminal", "telescope" },
})
