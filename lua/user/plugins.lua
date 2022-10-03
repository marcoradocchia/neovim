-- automatically install packer if not installed yet
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

-- autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init({
  display = {
    -- have packer use a popup window
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
    prompt_border = "rounded",
    done_sym = "",
    error_sym = "",
  },
})

-- install your plugins here
return packer.startup(function(use)
  -- lazy loading example
  -- use {
  --   'user/repo',
  --   ft = { 'tex', 'python' }, <- for filetypes
  --   require { {plugin1}, {plugin2} } <- for depnedecy plugins
  -- }

  use({ -- have packer manage itself
    "wbthomason/packer.nvim",
  })

  use({ -- useful plugins
    "nvim-lua/popup.nvim", -- an implementation of the popup api from vim in neovim
    "nvim-lua/plenary.nvim", -- useful lua functions used ny lots of plugins
  })

  use({ -- colorschemes
    "sainnhe/gruvbox-material",
  })

  use({ -- cmp plugins
    "hrsh7th/nvim-cmp", -- the completion plugin
    "hrsh7th/cmp-buffer", -- buffer completions
    "hrsh7th/cmp-path", -- path completions
    "hrsh7th/cmp-cmdline", -- cmdline completions
    "hrsh7th/cmp-nvim-lsp", -- lsp completions
    "hrsh7th/cmp-nvim-lua",
    "saadparwaiz1/cmp_luasnip", -- snippet completions
  })

  use({ -- snippets
    "L3MON4D3/LuaSnip", -- snippet engine
  })

  use({ -- LSP
    "neovim/nvim-lspconfig", -- enable LSP
    "williamboman/nvim-lsp-installer", -- simple to use language server installer
    "jose-elias-alvarez/null-ls.nvim", -- formatting and more
    "j-hui/fidget.nvim", -- UI for lsp progress
  })

  use({ -- telescope
    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-ui-select.nvim", -- neovim core stuff can fill the telescope picker
  })

  use({ -- treesitter
    { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
    "nvim-treesitter/playground",
    "nvim-treesitter/nvim-treesitter-context",
    "p00f/nvim-ts-rainbow",
  })

  use({ -- status and buffer lines
    -- "nvim-lualine/lualine.nvim",
    -- "akinsho/bufferline.nvim",
    -- "moll/vim-bbye",
    "rebelot/heirline.nvim"
  })

  use({ -- commenting
    "numToStr/Comment.nvim",
    "JoosepAlviste/nvim-ts-context-commentstring",
  })

  use({ -- git
    "lewis6991/gitsigns.nvim",
  })

  use({ -- file tree
    "kyazdani42/nvim-tree.lua",
  })

  use({ -- terminal
    "https://github.com/akinsho/toggleterm.nvim",
  })

  use({ -- colorizer
    "NvChad/nvim-colorizer.lua",
  })

  use({ -- crates.io interface for Cargo.toml files
    "saecki/crates.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  })

  use({ -- startup greeter
    "goolord/alpha-nvim",
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
