local nvim_tree = require("nvim-tree")
local nvim_tree_config = require("nvim-tree.config")
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
    "packer",
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
    hide_root_folder = false,
    side = "right",
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
    icons = {
      symlink_arrow = "  ",
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "+",
          unmerged = "",
          renamed = "»",
          deleted = "-",
          untracked = "?",
          ignored = "◌",
        },
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
        },
      },
    },
    add_trailing = true,
    group_empty = true,
    special_files = {
      "Cargo.toml",
      "Cargo.lock",
      "Makefile",
      "README.md",
      "readme.md",
      "CHANGELOG.md",
      "changelog.md",
      "LICENSE",
      "license",
      "requirements",
      "requirements.txt",
    },
    indent_markers = {
      enable = false,
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
          buftype = { "nofile", "terminal", "help", "alpha" },
        },
      },
    },
  },
})
