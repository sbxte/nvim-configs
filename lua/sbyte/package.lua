local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    'nvim-lua/plenary.nvim',
    'nvim-lua/popup.nvim',

    -- Telescope
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
    "debugloop/telescope-undo.nvim",
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-live-grep-args.nvim',
    'LukasPietzschmann/telescope-tabs',

    'nvim-telescope/telescope-fzf-native.nvim',

    -- Theme
    'navarasu/onedark.nvim',

    -- Custom Icons
    'nvim-tree/nvim-web-devicons',

    -- Git
    'tpope/vim-fugitive',
    'lewis6991/gitsigns.nvim',
    'debugloop/telescope-undo.nvim',

    -- Start screen dashboard
    'glepnir/dashboard-nvim',

    -- LSP
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'folke/neodev.nvim',

    -- Auto complete
    {
      'hrsh7th/nvim-cmp',
      event = { 'BufRead', 'BufNewFile' },
    },
    -- LSP completion source:
    {
      'hrsh7th/cmp-nvim-lsp',
      event = { 'BufRead', 'BufNewFile' },
    },

    -- Useful completion sources:
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/vim-vsnip',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    'folke/which-key.nvim',


    -- Fidget (LSP notification and progress messages)
    'j-hui/fidget.nvim',

    -- Comments
    'numToStr/Comment.nvim',

    -- Trouble (quickfix thing)
    "folke/trouble.nvim",

    -- Lua line status bar
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    -- Auto pair brackets and quotes
    'windwp/nvim-autopairs',

    -- Tab stop
    'tpope/vim-sleuth',

    -- Todo comments
    "folke/todo-comments.nvim",


    -- Discord presence
    -- 	'andweeb/presence.nvim',

    -- Vim tex (math go brr)
    -- 	'lervag/vimtex',

    -- Additional features for rust
    -- 	"simrat39/rust-tools.nvim",

    -- File tree
    'nvim-tree/nvim-tree.lua',

    -- Folding
    'kevinhwang91/promise-async',

    -- Better tabs
    {
      'akinsho/bufferline.nvim',
      dependencies = 'nvim-tree/nvim-web-devicons',
      event = 'BufEnter',
    },

    -- Marks
    'chentoast/marks.nvim',

    -- Leaping and jumping
    'ggandor/leap.nvim',
}

local opts = {

}

require("lazy").setup(plugins, opts)
