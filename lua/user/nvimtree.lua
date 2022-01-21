-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
local colors = COLORS

vim.cmd(string.format("highlight NvimTreeFolderName guifg=%s gui=bold", colors.blue))
vim.cmd(string.format("highlight NvimTreeRootFolder guifg=%s gui=bold", colors.magenta))
vim.cmd("highlight link NvimTreeIndentMarker LineNr")
vim.cmd(string.format("highlight NvimTreeEmptyFolderName guifg=%s gui=bold", colors.blue))
vim.cmd(string.format("highlight NvimTreeOpenedFolderName guifg=%s gui=bold", colors.blue))
vim.cmd(string.format("highlight NvimTreeFolderIcon guifg=%s gui=bold", colors.blue))
vim.cmd(string.format("highlight NvimTreeStatusLine guibg=%s guifg=%s gui=bold", colors.bg, colors.red))
vim.cmd(string.format("highlight NvimTreeStatusLineNC guibg=%s", colors.bg))
vim.cmd(string.format("highlight NvimTreeNormal guibg=%s", colors.bg))
vim.cmd(string.format("highlight NvimTreeNormalNC guibg=%s", colors.bg))
vim.cmd("highlight NvimTreeOpenedFile gui=bold")

vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_symlink_arrow = " -> "

vim.g.nvim_tree_icons = {
	default = "",
	symlink = "",
	git = {
		unstaged = "",
		staged = "S",
		unmerged = "",
		renamed = "➜",
		deleted = "✗",
		untracked = "U",
		ignored = "◌",
	},
	folder = {
		default = "",
		open = "",
		empty = "",
		empty_open = "",
		symlink = "",
	},
}

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
	return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = {
		"startify",
		"dashboard",
		"alpha",
	},
	auto_close = true,
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = true,
	update_to_buf_dir = {
		enable = true,
		auto_open = true,
	},
	diagnostics = {
		enable = true,
		icons = {
			error = "",
			warning = "",
			hint = "ﯦ",
			info = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	filters = {
		dotfiles = false,
		custom = {},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
	view = {
		width = 30,
		height = 30,
		hide_root_folder = false,
		side = "left",
		auto_resize = true,
		mappings = {
			custom_only = false,
			list = {
				{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
				{ key = "h", cb = tree_cb("close_node") },
				{ key = "v", cb = tree_cb("vsplit") },
				{ key = "x", cb = tree_cb("hsplit") },
			},
		},
		number = false,
		relativenumber = false,
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
	quit_on_open = 0,
	git_hl = 1,
	disable_window_picker = 0,
	root_folder_modifier = ":t",
	show_icons = {
		git = 1,
		folders = 1,
		files = 1,
		folder_arrows = 1,
		tree_width = 30,
	},
})
