-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
local colors = COLORS

vim.cmd(string.format("highlight NvimTreeSymlink guifg=%s gui=bold", colors.cyan))
vim.cmd(string.format("highlight NvimTreeFolderName guifg=%s gui=bold", colors.blue))
vim.cmd(string.format("highlight NvimTreeRootFolder guifg=%s gui=bold", colors.yellow))
vim.cmd(string.format("highlight NvimTreeEmptyFolderName guifg=%s gui=bold", colors.blue))
vim.cmd(string.format("highlight NvimTreeOpenedFolderName guifg=%s gui=bold", colors.blue))
vim.cmd(string.format("highlight NvimTreeExecFile guifg=%s gui=bold", colors.green))
vim.cmd(string.format("highlight NvimTreeOpenedFile guifg=%s gui=bold", colors.red))
vim.cmd(string.format("highlight NvimTreeSpecialFile guifg=%s gui=bold", colors.red))
vim.cmd(string.format("highlight NvimTreeImageFile guifg=%s gui=bold", colors.magenta))
vim.cmd(string.format("highlight NimTreeMarkdownFile guifg=%s gui=bold,underline", colors.yellow))
vim.cmd(string.format("highlight NvimTreeFolderIcon guifg=%s gui=bold", colors.blue))
vim.cmd(string.format("highlight NvimTreeLicenseIcon guifg=%s gui=bold", colors.fg))
vim.cmd(string.format("highlight NvimTreeYamlIcon guifg=%s gui=bold", colors.green))
vim.cmd(string.format("highlight NvimTreeTomlIcon guifg=%s gui=bold", colors.green))
vim.cmd(string.format("highlight NvimTreeGitignoreIcon guifg=%s gui=bold", colors.fg))
vim.cmd(string.format("highlight NvimTreeJsonIcon guifg=%s gui=bold", colors.gf))
vim.cmd(string.format("highlight NvimTreeLuaIcon guifg=%s gui=bold", colors.blue))
vim.cmd(string.format("highlight NvimTreePythonIcon guifg=%s gui=bold", colors.yellow))
vim.cmd(string.format("highlight NvimTreeShellIcon guifg=%s gui=bold", colors.cyan))
vim.cmd(string.format("highlight NvimTreeJavascriptIcon guifg=%s gui=bold", colors.red))
vim.cmd(string.format("highlight NvimTreeCIcon guifg=%s gui=bold", colors.blue))
vim.cmd(string.format("highlight NvimTreeReactIcon guifg=%s gui=bold", colors.blue))
vim.cmd(string.format("highlight NvimTreeHtmlIcon guifg=%s gui=bold", colors.green))
vim.cmd(string.format("highlight NvimTreeRustIcon guifg=%s gui=bold", colors.red))
vim.cmd(string.format("highlight NvimTreeVimIcon guifg=%s gui=bold", colors.green))
vim.cmd(string.format("highlight NvimTreeTypescriptIcon guifg=%s gui=bold", colors.blue))
vim.cmd(string.format("highlight NvimTreeGitDirty guifg=%s gui=bold", colors.orange))
vim.cmd(string.format("highlight NvimTreeGitStaged guifg=%s gui=bold", colors.green))
vim.cmd(string.format("highlight NvimTreeGitMerge guifg=%s gui=bold", colors.orange))
vim.cmd(string.format("highlight NvimTreeGitRenamed guifg=%s gui=bold", colors.yellow))
vim.cmd(string.format("highlight NvimTreeGitNew guifg=%s gui=bold", colors.green))
vim.cmd(string.format("highlight NvimTreeGitDeleted guifg=%s gui=bold", colors.red))
vim.cmd(string.format("highlight NvimTreeWindowPicker guifg=%s gui=bold", colors.red))
vim.cmd(string.format("highlight NvimTreeFileDirty guifg=%s gui=bold", colors.red))
vim.cmd(string.format("highlight NvimTreeFileStaged guifg=%s gui=bold", colors.green))
vim.cmd(string.format("highlight NvimTreeFileMerge guifg=%s gui=bold", colors.orange))
vim.cmd(string.format("highlight NvimTreeFileRenamed guifg=%s gui=bold", colors.yellow))
vim.cmd(string.format("highlight NvimTreeFileNew guifg=%s gui=bold", colors.green))
vim.cmd(string.format("highlight NvimTreeFileDeleted guifg=%s gui=bold", colors.red))

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
