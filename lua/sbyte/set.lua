vim.g.mapleader = " "
vim.g.guicursor = {
  n = "block",
  v = "block",
  c = "block",
  i = "ver25",
  ci = "ver25",
  ve = "ver25",
  r = "hor20",
  cr = "hor20",
  o = "hor50",
  a = "blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
  sm = "block-blinkwait175-blinkoff150-blinkon175"
}
vim.opt.nu = true
vim.opt.rnu = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = 2

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.o.updatetime = 1250
vim.o.timeout = true
vim.o.timeoutlen = 500

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'


-- Custom remaps
local map = function(mode, l, r, desc)
  if desc then
    desc = 'Custom: ' .. desc
  end
  vim.keymap.set(mode, l, r, { desc = desc, noremap = true, silent = true })
end

map("n", "<leader>vvcs", ":e ~/appdata/local/nvim/lua/sbyte/set.lua<CR>", "Neo[V]im [C]onfig [S]et.lua")
map("n", "<leader>vvcp", ":e ~/appdata/local/nvim/lua/sbyte/packer.lua<CR>", "Neo[V]im [C]onfig [P]acker.lua")

map("v", "J", ":m '>+1<CR>gv=gv", "Move selected lines down")
map("v", "K", ":m '<-2<CR>gv=gv", "Move selected lines up")

map("n", "J", "mzJ`z", "Custom [J]")
map("n", "<C-d>", "<C-d>zz", "Scroll down and center cursor")
map("n", "<C-u>", "<C-u>zz", "Scroll up and center cursor")

map("n", "<leader>y", "\"+y", "Yank to clipboard")
map("v", "<leader>y", "\"+y", "Yank to clipboard")

map("n", "tn", ":tabnew<CR>", "New tab")
map("n", "tc", ":tabclose<CR>", "Close tab")
map("n", "tt", ":tabn<CR>", "Next tab")
map("n", "tT", ":tabp<CR>", "Previous tab")

map("i", "<C-c>", "<Esc>", "<Esc>") -- <C-[> is available too btw
map("n", "Q", ":q!<CR>", "Quit file without writing")
map("n", "W", ":update<CR>", "Write file")

-- Git Fugitive
map("n", "<leader>gs", vim.cmd.Git, "Open git vugitive");


-- Todo comments
map("n", "[t", function()
  require("todo-comments").jump_prev({keywords = { "TODO", "INFO", "ERROR", "WARNING" }})
end, "Previous todo comment")

map("n", "]t", function()
  require("todo-comments").jump_next({keywords = { "TODO", "INFO", "ERROR", "WARNING" }})
end, "Next todo comment")


-- Trouble
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", "Open trouble quickfix")

-- Telescope

local tsbuiltin = require('telescope.builtin')
map('n', '<leader>?', tsbuiltin.oldfiles, '[?] Find recently opened files')
map('n', '<leader><space>', tsbuiltin.buffers, '[ ] Find existing buffers')
map('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  tsbuiltin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, '[/] Fuzzily search in current buffer')
map('n', '<leader>sf', tsbuiltin.find_files, '[S]earch [F]iles')
map('n', '<leader>sh', tsbuiltin.help_tags, '[S]earch [H]elp')
map('n', '<leader>sw', tsbuiltin.grep_string, '[S]earch current [W]ord')
map('n', '<leader>sg', tsbuiltin.live_grep, '[S]earch by [G]rep')
map('n', '<leader>sd', tsbuiltin.diagnostics, '[S]earch [D]iagnostics')

map('n', '<leader>sk', ':Telescope keymaps<CR>', '[S]earch [K]ey Remaps') -- I know there probably exists a better way of doing this but am too lazy to find out

-- Undotree
map("n", "<leader>u", vim.cmd.UndotreeToggle, 'Open [U]ndotree')


-- Nvim Tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", 'Open NvimTree [E]xplorer')