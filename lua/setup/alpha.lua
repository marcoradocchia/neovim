local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
  [[  ,-.    _   _  _____ _____  _   _ ________  ___       ]],
  [[  \_/   | \ | ||  ___|  _  || | | |_   _|  \/  |  ,-.  ]],
  [[ {|||)< |  \| || |__ | | | || | | | | | | .  . |  \_/  ]],
  [[  / \   | . ` ||  __|| | | || | | | | | | |\/| | {|||)<]],
  [[  `-'   | |\  || |___\ \_/ /\ \_/ /_| |_| |  | |  / \  ]],
  [[        \_| \_/\____/ \___/  \___/ \___/\_|  |_/  `-'  ]],
}

dashboard.section.buttons.val = {
  dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
  dashboard.button("g", "  Live Grep", ":Telescope live_grep <CR>"),
  dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
  dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

-- Footer --
dashboard.section.footer.val = function()
  local plugins = #vim.tbl_keys(packer_plugins)
  local version = vim.version()

  return string.format(
    "%d plugins | v%d.%d.%d",
    plugins,
    version.major,
    version.minor,
    version.patch
  )
end

-- Options --
dashboard.opts.opts.noautocmd = true

require("alpha").setup(dashboard.opts)
