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
    -- for file icons
    use "nvim-tree/nvim-web-devicons"
    -- VSCode kind icons
    use "onsails/lspkind.nvim"

  -- Essential
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim"    -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"  -- Useful lua functions used ny lots of plugins

    -- Language server support
    use "williamboman/mason.nvim" -- simple to use language server installer
    use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
    use "neovim/nvim-lspconfig" -- enable LSP

    -- Popup menu
    -- cmp plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"

  -- Productivity
    -- An neovim explorer
    use "nvim-tree/nvim-tree.lua"

    -- Treesitter autotag for HTML
    use "windwp/nvim-ts-autotag"
    use "ziontee113/color-picker.nvim" -- pick colors in the terminal
    -- Neovim line commenter
    use "numToStr/Comment.nvim"
    -- Multi cursor
    use "mg979/vim-visual-multi"
    -- Autopair for quote, braces etc.
    use {
      "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    -- Git integration for neovim
    use "lewis6991/gitsigns.nvim"
    -- Move lines
    use "matze/vim-move"
    -- Color code preview
    use "norcalli/nvim-colorizer.lua"
    -- Fuzzy Finder
    use "nvim-telescope/telescope.nvim"

  -- Complements
    -- Adds extra features for neovim
    use {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    }
    -- Nice tabline, an listing buffers
    use {
      "romgrk/barbar.nvim",
      wants = "nvim-web-devicons"
    }
    -- A good indentation level guide
    use "lukas-reineke/indent-blankline.nvim"

  -- Snippets
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use {
      "L3MON4D3/LuaSnip", --snippet engine
      tag = "v<CurrentMajor>.*"
    }
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- Preview
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- Miscellaneous
    use {
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true }
    }
    -- Colorschemes
      -- A bunch of colorschemes you can try out use "lunarvim/darkplus.nvim"
      -- use "lunarvim/colorschemes"
      use "rafi/awesome-vim-colorschemes"
      use "sam4llis/nvim-tundra"
      use "ellisonleao/gruvbox.nvim"

    -- Presence for Discord Rich Presence
      use "andweeb/presence.nvim"
end)

--- Include the plugins ---
-- require("user.cmp")
-- require("user.mason")
