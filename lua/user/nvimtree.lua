-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
local colors = COLORS

vim.cmd(string.format("highlight NvimTreeStatusLine guibg=%s guifg=%s gui=bold", colors.bg, colors.red))
vim.cmd(string.format("highlight NvimTreeStatusLineNC guibg=%s", colors.bg))
vim.cmd(string.format("highlight NvimTreeNormal guibg=%s", colors.bg))
vim.cmd(string.format("highlight NvimTreeNormalNC guibg=%s", colors.bg))
vim.cmd(string.format("highlight NvimTreeWindowPicker guifg=%s guibg=%s gui=bold", colors.bg, colors.yellow))
vim.cmd("highlight NvimTreeOpenedFile gui=bold")

vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_symlink_arrow = " "
vim.g.nvim_tree_special_files = {
	Makefile = true,
  ["Cargo.toml"] = true,
	["README.md"] = true,
	["readme.md"] = true,
}

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
	open_on_setup_file = false,
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = true,
	ignore_ft_on_setup = {
		"startify",
		"dashboard",
		"alpha",
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
		preserve_window_proportions = true,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
		mappings = {
			custom_only = false,
			list = {
				{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
				{ key = "h", cb = tree_cb("close_node") },
				{ key = "v", cb = tree_cb("vsplit") },
				{ key = "x", cb = tree_cb("hsplit") },
			},
		},
	},
	renderer = {
		indent_markers = {
			enable = true,
			-- in order to customize the indent markers icons
			-- icons = {
			-- 	corner = "└ ",
			-- 	edge = "│ ",
			-- 	none = "  ",
			-- },
		},
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
	actions = {
		use_system_clipboard = true,
		change_dir = {
			enable = true,
			global = false,
			restrict_above_cwd = false,
		},
		open_file = {
			quit_on_open = false,
			resize_window = false,
			window_picker = {
				enable = true,
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
					buftype = { "nofile", "terminal", "help" },
				},
			},
		},
	},
})
