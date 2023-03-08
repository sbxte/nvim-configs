-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'


  -- Telescope
  use ("nvim-lua/popup.nvim")
  use ('nvim-lua/plenary.nvim')
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  }


  -- Theme (One dark)
  use {
    'navarasu/onedark.nvim',
    as = 'onedark',
    config = function()
      vim.cmd('colorscheme onedark')
    end
  }


  -- Tree sitter
  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }
  use ('nvim-treesitter/playground')
  use("nvim-treesitter/nvim-treesitter-context")


  -- Git and history stuff
  use ('mbbill/undotree')
  use ('tpope/vim-fugitive')
  use ('tpope/vim-rhubarb')

  use { -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  }


  -- LSP
  use ('williamboman/mason.nvim')
  use ('williamboman/mason-lspconfig.nvim')
  use {
    'j-hui/fidget.nvim',
    config = function()
      require("fidget").setup()
    end
  }
  use ('folke/neodev.nvim')
  use ('neovim/nvim-lspconfig')

  -- Auto complete
  use ('hrsh7th/nvim-cmp')
  use ('hrsh7th/cmp-nvim-lsp')
  use ('L3MON4D3/LuaSnip')
  use ('saadparwaiz1/cmp_luasnip')
  use ('hrsh7th/vim-vsnip')

  use { 'folke/which-key.nvim', opts = {} } -- Uhhh. Keybinds?


  -- "gc" to comment visual regions/lines
  use { 'numToStr/Comment.nvim', opts = {} }


  -- Trouble (quickfix thing)
  use {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {
        icons = false,
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }


  -- Lua line status bar
  use ('kyazdani42/nvim-web-devicons')
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }


  -- Auto pair brackets and quotes
  use ('windwp/nvim-autopairs')

  -- Tab stop
  use ('tpope/vim-sleuth')

  -- Todo comments
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim"
  }


  -- Discord presence
  use ('andweeb/presence.nvim') -- lmfaoaoaoaoao


  -- Vim tex (math go brr)
  use ('lervag/vimtex')


  -- Additional features for rust
  use ("simrat39/rust-tools.nvim")
end)

