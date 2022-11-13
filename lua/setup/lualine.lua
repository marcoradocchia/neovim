local lualine = require("lualine")

lualine.setup({
  options = {
    theme = "tokyonight",
    section_separators = "",
    component_separators = "|",
  },
  sections = {
    lualine_c = {
      {
        "filename",
        path = 1, -- relative path
      }
    },
  }
})
