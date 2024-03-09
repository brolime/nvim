-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself --
  use 'wbthomason/packer.nvim'
  --╔═════════════════════════╗--
  --║  Telescope fuzzy finder ║--
  --╚═════════════════════════╝--
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }

  }
  --╔═════════════════════════╗--
  --║ Themes and colorschemes ║--
  --╚═════════════════════════╝--
  use ({ 'catppuccin/nvim', as = 'catppuccin' })
  use ({ 'rose-pine/neovim', as = 'rose-pine' })
  use { 'nvim-tree/nvim-web-devicons' }

  --╔═════════════╗--
  --║  Treesitter ║--
  --╚═════════════╝--
  use ( 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'} )
  use ('nvim-treesitter/playground')


  --╔══════════════════╗--
  --║  Better Comments ║--
  --╚══════════════════╝--
  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }

  --╔══════════════════════════╗--
  --║      Startup screen      ║--
  --╚══════════════════════════╝--
  use {
    "startup-nvim/startup.nvim",
    requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    config = function()
      require"startup".setup()
    end
  }

  --╔═════════╗--
  --║ Harpoon ║--
  --╚═════════╝--
  use ('ThePrimeagen/harpoon')

  --╔═══════════╗--
  --║ Undo Tree ║--
  --╚═══════════╝--
  use ('mbbill/undotree')
  --╔═══════════╗--
  --║ Lua Line  ║--
  --╚═══════════╝--
  use {
      'nvim-lualine/lualine.nvim',
      requires = {'nvim-tree/nvim-web-devicons', opt = true }
  }
  require('lualine').setup()
  --╔══════════════╗--
  --║ Vim fugitive ║--
  --╚══════════════╝--
  use ('tpope/vim-fugitive')
  --╔═════════╗--
  --║   LSP   ║--
  --╚═════════╝--
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  }
end)
