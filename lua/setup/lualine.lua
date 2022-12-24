require("lualine").setup({
  options = {
    theme = "catppuccin",
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
