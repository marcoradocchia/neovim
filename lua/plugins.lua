-- Automatically install packer if not installed yet.
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({
    "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
    install_path
  })
  is_bootstrap = true
  vim.cmd("packadd packer.nvim")
end

-- Plugin configuration.
local function setup(name)
  return string.format('require("setup/%s")', name)
end

local packer = require("packer")

packer.init({
  display = {
    done_sym = "",
    error_sym = "",
  },
})

packer.startup(function(use)
  -- Packer --
  use("wbthomason/packer.nvim")

  -- Colorscheme --
  use({
    "catppuccin/nvim",
    as = "catppuccin",
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
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = setup("null-ls")
      },
      {
        "j-hui/fidget.nvim",
        config = setup("fidget")
      },
      "folke/neodev.nvim",
      {
        "simrat39/rust-tools.nvim",
        -- after = {
        --   "nvim-lspconfig",
        --   "mason-lspconfig.nvim",
        -- }
      },
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
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
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
    requires = {
      "nvim-tree/nvim-web-devicons",
      config = setup("devicons")
    },
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

  -- No distraction mode --
  use {
    "folke/zen-mode.nvim",
    config = setup("zen")
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if is_bootstrap then
    require("packer").sync()
  end
end)

-- Automatically source and sync packer whenever you save current buffer.
vim.cmd([[
  augroup Packer
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Bootstrapping configuration.
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print "=================================="
  print "    Plugins are being installed"
  print "    Wait until Packer completes,"
  print "       then restart nvim"
  print "=================================="
  return
end
