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

local ViMode = {
  -- get vim current mode, this information will be required by the provider
  -- and the highlight functions, so we compute it only once per component
  -- evaluation and store it as a component attribute
  init = function(self)
    self.mode = vim.fn.mode(1) -- :h mode()

    -- execute this only once, this is required if you want the ViMode
    -- component to be updated on operator pending mode
    if not self.once then
      vim.api.nvim_create_autocmd("ModeChanged", {
        pattern = "*:*o",
        command = 'redrawstatus'
      })
      self.once = true
    end
  end,
  -- Now we define some dictionaries to map the output of mode() to the
  -- corresponding string and color. We can put these into `static` to compute
  -- them at initialisation time.
  static = {
    mode_names = { -- change the strings if you like it vvvvverbose!
      n = "N",
      no = "N?",
      nov = "N?",
      noV = "N?",
      ["no\22"] = "N?",
      niI = "Ni",
      niR = "Nr",
      niV = "Nv",
      nt = "Nt",
      v = "V",
      vs = "Vs",
      V = "V_",
      Vs = "Vs",
      ["\22"] = "^V",
      ["\22s"] = "^V",
      s = "S",
      S = "S_",
      ["\19"] = "^S",
      i = "I",
      ic = "Ic",
      ix = "Ix",
      R = "R",
      Rc = "Rc",
      Rx = "Rx",
      Rv = "Rv",
      Rvc = "Rv",
      Rvx = "Rv",
      c = "C",
      cv = "Ex",
      r = "...",
      rm = "M",
      ["r?"] = "?",
      ["!"] = "!",
      t = "T",
    },
    mode_colors = {
      n = colors.red,
      i = colors.green,
      v = colors.orange,
      V = colors.orange,
      ["\22"] = colors.orange,
      c = colors.yellow,
      s = colors.blue,
      S = colors.blue,
      ["\19"] = colors.blue,
      R = colors.magenta,
      r = colors.magenta,
      ["!"] = colors.cyan,
      t = colors.cyan,
    }
  },
  -- We can now access the value of mode() that, by now, would have been
  -- computed by `init()` and use it to index our strings dictionary.
  -- note how `static` fields become just regular attributes once the
  -- component is instantiated.
  -- To be extra meticulous, we can also add some vim statusline syntax to
  -- control the padding and make sure our string is always at least 2
  -- characters long. Plus a nice Icon.
  provider = function(self)
    return " %2(" .. self.mode_names[self.mode] .. "%)"
  end,
  -- Same goes for the highlight. Now the foreground will change according to the current mode.
  hl = function(self)
    local mode = self.mode:sub(1, 1) -- get only the first mode character
    return { fg = self.mode_colors[mode], bold = true, bg = colors.bg_dark }
  end,
  -- Re-evaluate the component only on ModeChanged event!
  -- This is not required in any way, but it's there, and it's a small
  -- performance improvement.
  update = {
    "ModeChanged",
  },
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
  ViMode, AlignRight, Lsp, Ruler, ScrollBar
}

heirline.setup(StatusLine)
-- After calling setup(), your StatusLine object will be created, and you can
-- find its handle at require'heirline'.statusline (and
-- require'heirline'.winbar and require'heirline'.tabline).
-- Any modification to the object itself will reflect in real time on your statusline!
