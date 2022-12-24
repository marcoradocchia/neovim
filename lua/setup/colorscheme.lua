require("catppuccin").setup({
  integrations = {
    treesitter = true,
    treesitter_context = true,
    cmp = true,
    telescope = true,
    gitsigns = true,
    nvimtree = true,
    fidget = true,
  },
})

-- require("tokyonight").setup({
--   style = "moon",
--   sidebars = { "qf", "help", "packer", "terminal" },
--   lualine_bold = true
-- })

vim.cmd.colorscheme("catppuccin-mocha")
