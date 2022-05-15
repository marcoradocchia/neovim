-- ██╗███╗   ██╗██╗████████╗██╗     ██╗   ██╗ █████╗
-- ██║████╗  ██║██║╚══██╔══╝██║     ██║   ██║██╔══██╗
-- ██║██╔██╗ ██║██║   ██║   ██║     ██║   ██║███████║
-- ██║██║╚██╗██║██║   ██║   ██║     ██║   ██║██╔══██║
-- ██║██║ ╚████║██║   ██║██╗███████╗╚██████╔╝██║  ██║
-- ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝

COLORS = require("user.colors.gruvbox_material")
require("user.options")
require("user.keymaps")
require("user.autocommands")
require("user.plugins")
require("user.colorscheme")
require("user.cmp")
require("user.telescope")
require("user.treesitter")
require("user.lualine")
require("user.luasnip")
require("user.indentblankline")
require("user.comment")
require("user.autopairs")
require("user.gitsigns")
require("user.nvimtree")
require("user.bufferline")
require("user.toggleterm")
require("user.nvimcolorizer")
require("user.alpha")
require("user.lsp")

-- TODO:
--  * FEATURES:
--    * single status line * FIX:
--    * cycling quickly through cmp results selects one randomly
