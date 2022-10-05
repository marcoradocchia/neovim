local status_ok, heirline = pcall(require, "heirline")
if not status_ok then
  return
end

local conditions = require("heirline.conditions")
local utils = require("heirline.utils")
local colors = require("user.colors.gruvbox_material")

-- Highlight groups
local highlight = {
  bar = { fg = colors.fg, bg = colors.bg_dark },
  lsp = { bold = true, fg = colors.blue, bg = colors.bg_dark },
  ruler = { bold = true, fg = colors.orange, bg = colors.bg_dark }
}

local AlignRight = {
  provider = "%=",
  hl = highlight.bar
}

local Lsp = {
  condition = conditions.lsp_attached,
  update = { 'LspAttach', 'LspDetach' },

  provider = function()
    local names = {}
    for _, server in pairs(vim.lsp.buf_get_clients(0)) do
      table.insert(names, server.name)
    end
    return " [" .. table.concat(names, " ") .. "]"
  end,
  hl = highlight.lsp,
}

local Ruler = {
  provider = ' %7(%l/%L%):%-3(%v%) ',
  hl = { bold = true, fg = colors.fg, bg = colors.bg_dark },
}

local ScrollBar = {
  static = {
    sbar = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' }
  },
  provider = function(self)
    local curr_line = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_line_count(0)
    local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
    return string.rep(self.sbar[i], 2)
  end,
  hl = highlight.ruler
}

-- STATUSLINE
local StatusLine = {
  AlignRight, Lsp, Ruler, ScrollBar
}

heirline.setup(StatusLine)
-- After calling setup(), your StatusLine object will be created, and you can
-- find its handle at require'heirline'.statusline (and
-- require'heirline'.winbar and require'heirline'.tabline).
-- Any modification to the object itself will reflect in real time on your statusline!
