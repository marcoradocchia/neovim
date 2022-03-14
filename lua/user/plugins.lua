local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	-- Have packer use a popup window
	-- display = {
	-- 	open_fn = function()
	-- 		return require("packer.util").float({ border = "rounded" })
	-- 	end,
	-- },
})

-- Install your plugins here
return packer.startup(function(use)
	-- Plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself

	use({ -- useful plugins
		"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
		"nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
	})
	-- Lazy loading example
	-- use {
	--   'user/repo',
	--   ft = { 'tex', 'python' }, <- for filetypes
	--   require { {plugin1}, {plugin2} } <- for depnedecy plugins
	-- }

	-- colorschemes
	use({
    "sainnhe/gruvbox-material"
  })

	use({ -- cmp plugins
		"hrsh7th/nvim-cmp", -- the completion plugin
		"hrsh7th/cmp-buffer", -- buffer completions
		"hrsh7th/cmp-path", -- path completions
		"hrsh7th/cmp-cmdline", -- cmdline completions
		"hrsh7th/cmp-nvim-lsp", -- lsp completions
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-calc", -- nvim-cmp source for math calculation
		"saadparwaiz1/cmp_luasnip", -- snippet completions
	})

	use({ -- snippets
		"L3MON4D3/LuaSnip", -- snippet engine
		"rafamadriz/friendly-snippets", -- a bunch of snippets to use
	})

	use({ -- LSP
		"neovim/nvim-lspconfig", -- enable LSP
		"williamboman/nvim-lsp-installer", -- simple to use language server installer
		"jose-elias-alvarez/null-ls.nvim", -- formatting and more
	})

	use({ -- telescope
		"nvim-telescope/telescope.nvim",
	})

	use({ -- treesitter
		{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
		"p00f/nvim-ts-rainbow",
	})

	use({ -- status and buffer lines
		"nvim-lualine/lualine.nvim",
	})

	use({ -- indentation
		"lukas-reineke/indent-blankline.nvim",
	})

	use({ -- commenting
		"numToStr/Comment.nvim",
		"JoosepAlviste/nvim-ts-context-commentstring",
	})

	use({ -- parenthesis and more
		"windwp/nvim-autopairs", -- integrates with both cmp and treesitter
	})

	use({ -- git
		"lewis6991/gitsigns.nvim",
	})

	use({ -- file tree
		"kyazdani42/nvim-tree.lua", -- actual file tree
	})

	use({ -- bufferline
		"akinsho/bufferline.nvim",
		"moll/vim-bbye",
	})

	use({ -- terminal
		"https://github.com/akinsho/toggleterm.nvim",
	})

	use({ -- colorizer
		"norcalli/nvim-colorizer.lua",
	})

	use({ -- startup greater
		"goolord/alpha-nvim",
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
