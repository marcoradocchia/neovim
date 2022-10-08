local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
  [[  ,-.    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗        ]],
  [[  \_/    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║   ,-.  ]],
  [[ {|||)<  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║   \_/  ]],
  [[  / \    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║  {|||)<]],
  [[  `-'    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║   / \  ]],
  [[         ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝   `-'  ]],
}
dashboard.section.buttons.val = {
  dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
  dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
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

-- Colors --
dashboard.section.footer.opts.hl = "Boolean"
dashboard.section.header.opts.hl = "@tag"
dashboard.section.buttons.opts.hl = "Keyword"

-- Options --
dashboard.opts.opts.noautocmd = true

alpha.setup(dashboard.opts)
