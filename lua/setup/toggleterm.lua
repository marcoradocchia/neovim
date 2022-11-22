local toggleterm = require("toggleterm")

toggleterm.setup({
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<leader>\]],
  shade_terminals = true,
  insert_mappings = false,
  winbar = {
    enabled = true,
  }
})
