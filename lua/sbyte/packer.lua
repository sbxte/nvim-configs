-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'


  -- Telescope
  use("nvim-lua/popup.nvim")
  use('nvim-lua/plenary.nvim')
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      "debugloop/telescope-undo.nvim",
      'nvim-telescope/telescope-file-browser.nvim',
      'nvim-telescope/telescope-live-grep-args.nvim',
    }
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
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
  use 'nvim-tree/nvim-web-devicons' -- Custom icons


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
  use('nvim-treesitter/playground')
  use("nvim-treesitter/nvim-treesitter-context")


  -- Git and history stuff
  -- use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('tpope/vim-rhubarb')
  use { -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
  }
  use {
    "debugloop/telescope-undo.nvim",
    requires = 'nvim-telescope/telescope.nvim'
  }

  -- Start screen
  use {
    'glepnir/dashboard-nvim',
    requires = 'nvim-tree/nvim-web-devicons'
  }


  -- LSP
  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')
  use('folke/neodev.nvim')
  use('neovim/nvim-lspconfig')

  -- Auto complete
  use('hrsh7th/nvim-cmp')
  -- LSP completion source:
  use 'hrsh7th/cmp-nvim-lsp'

  -- Useful completion sources:
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use('hrsh7th/cmp-vsnip')
  use('hrsh7th/cmp-path')
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/vim-vsnip'
  use('L3MON4D3/LuaSnip')
  use('saadparwaiz1/cmp_luasnip')

  use { 'folke/which-key.nvim', opts = {} } -- Uhhh. Keybinds?


  -- "gc" to comment visual regions/lines
  use { 'numToStr/Comment.nvim', opts = {} }


  -- Trouble (quickfix thing)
  use ("folke/trouble.nvim")


  -- Lua line status bar
  use {
    'nvim-lualine/lualine.nvim',
    requires = ('nvim-tree/nvim-web-devicons')
  }


  -- Auto pair brackets and quotes
  use('windwp/nvim-autopairs')

  -- Tab stop
  use('tpope/vim-sleuth')

  -- Todo comments
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim"
  }


  -- Discord presence
  use('andweeb/presence.nvim')  -- lmfaoaoaoaoao


  -- Vim tex (math go brr)
  use('lervag/vimtex')


  -- Additional features for rust
  use("simrat39/rust-tools.nvim")


  -- File tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }

  -- Folding
  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

  -- Better tabs
  -- use {'romgrk/barbar.nvim', requires = 'nvim-web-devicons'}
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

  -- Marks
  use {'chentoast/marks.nvim'}

  -- Leaping and jumping
  use {'ggandor/leap.nvim'}

  -- Markdown (possibly?)
end)
