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
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

packer.startup(function(use)
  
  -- As Dependecies
  use "nvim-tree/nvim-web-devicons" -- optional, for file icons

  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim"    -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"  -- Useful lua functions used ny lots of plugins

  -- NvimTree
  use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end,
  } 

  -- Barbar
  use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}

  -- Indent Blankline
  use "lukas-reineke/indent-blankline.nvim"

  -- Comment
  use 'numToStr/Comment.nvim'

  -- Autopairs --
  use {
    "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  }

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- snippets
  use {
    "L3MON4D3/LuaSnip", --snippet engine
    tag = "v<CurrentMajor>.*"
  }
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

	-- LSP
  use "williamboman/mason.nvim" -- simple to use language server installer
  use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
  use "neovim/nvim-lspconfig" -- enable LSP

  use "lewis6991/gitsigns.nvim"

  -- VSCode kind icons
  use 'onsails/lspkind.nvim'

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out use "lunarvim/darkplus.nvim"
  use "nvim-tree/nvim-tree.lua"
  use "rafi/awesome-vim-colorschemes"
  use 'sam4llis/nvim-tundra'
  use "ellisonleao/gruvbox.nvim"

  -- HTML utilities
  use 'windwp/nvim-ts-autotag'
  -- CSS utilities
  use 'norcalli/nvim-colorizer.lua'
  use 'ziontee113/color-picker.nvim' -- pick colors in the terminal
  

  -- Status Line ---
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
end)

--- Include the plugins ---
-- require("user.cmp")
-- require("user.mason")
