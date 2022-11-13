-- Automatically install packer if not installed yet.
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer! Close and reopen Neovim...")
  vim.cmd("packadd packer.nvim")
end

local success, packer = pcall(require, "packer")
if not success then
  return
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file.
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local function setup(name)
  return string.format('require("setup/%s")', name)
end

packer.init({
  display = {
    done_sym = "",
    error_sym = "",
  },
})

return packer.startup(function(use)
  -- Packer --
  use("wbthomason/packer.nvim")

  -- Colorscheme --
  use({
    "folke/tokyonight.nvim",
    config = setup("colorscheme")
  })

  -- Startup --
  use({
    "goolord/alpha-nvim",
    config = setup("alpha")
  })

  -- Statusline --
  use({
    "nvim-lualine/lualine.nvim",
    config = setup("lualine")
  })

  -- LSP --
  use({
    "neovim/nvim-lspconfig",
    requires = {
      "williamboman/nvim-lsp-installer", -- server installer
      "jose-elias-alvarez/null-ls.nvim", -- formatting and more
      "nvim-lua/popup.nvim",
      {
        "j-hui/fidget.nvim", -- UI for lsp progress
        config = setup("fidget")
      }
    },
    config = setup("lsp"),
  })

  -- Completions --
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer", -- buffer completions
      "hrsh7th/cmp-path", -- path completions
      "hrsh7th/cmp-cmdline", -- cmdline completions
      "hrsh7th/cmp-nvim-lsp", -- lsp completions
      "hrsh7th/cmp-nvim-lua", -- nvim lua apis completions
      "saadparwaiz1/cmp_luasnip", -- snippet completions
    },
    config = setup("cmp")
  })

  -- Snippets --
  use({
    "L3MON4D3/LuaSnip",
    config = setup("luasnip")
  })

  -- Telescope --
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = setup("telescope")
  })

  -- Treesitter --
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    requires = {
      "nvim-treesitter/playground",
      "nvim-treesitter/nvim-treesitter-context",
      "p00f/nvim-ts-rainbow",
    },
    config = setup("treesitter")
  })

  -- Comments --
  use({
    "numToStr/Comment.nvim",
    requires = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = setup("comment")
  })

  -- Git --
  use({
    "lewis6991/gitsigns.nvim",
    config = setup("gitsigns")
  })

  -- File tree --
  use({
    "kyazdani42/nvim-tree.lua",
    config = setup("nvimtree")
  })

  -- Colorizer --
  use({
    "NvChad/nvim-colorizer.lua",
    config = setup("nvimcolorizer")
  })

  -- Crates.io --
  use({
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = setup("crates")
  })

  -- .yuck filetype support --
  use("elkowar/yuck.vim")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
