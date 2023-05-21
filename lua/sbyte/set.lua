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

vim.o.foldcolumn = '0'
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true


-- Custom remaps
local category = "Custom"
local cat = function (name) category = name end
local map = function(mode, l, r, desc)
  if desc then
    desc = category .. ": " .. desc
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

map("v", "<leader>yy", "\"+y", "Yank to clipboard")
map("v", "<leader>yp", "\"_d\"+p", "Paste from clipboard")
map("v", "<leader>yP", "\"_d\"+P", "Paste from clipboard")
map("n", "<leader>yp", "\"+p", "Paste from clipboard")
map("n", "<leader>yP", "\"+P", "Paste from clipboard")

map("n", "tc", ":bd<CR>", "Close buffer")
map("n", "tt", ":bn<CR>", "Next buffer")
map("n", "tT", ":bp<CR>", "Previous buffer")
map("n", "tl", ":ls<CR>", "List buffers")
map("n", "Tn", ":tabnew<CR>", "New tab")
map("n", "Tc", ":tabclose<CR>", "Close tab")
map("n", "Tt", ":tabn<CR>", "Next tab")
map("n", "TT", ":tabp<CR>", "Previous tab")

-- map("i", "<C-c>", "<Esc>", "<Esc>") -- <C-[> is available too btw
map("n", "Q", ":q!<CR>", "Quit file without writing")
map("n", "W", ":w<CR>", "Write file")

-- Git Fugitive
cat("GitFugitive")
map("n", "<leader>gs", vim.cmd.Git, "Open Git");


-- Todo comments
cat("TodoComment")
map("n", "[t", function()
  require("todo-comments").jump_prev({keywords = { "TODO", "INFO", "ERROR", "WARNING" }})
end, "Previous todo comment")

map("n", "]t", function()
  require("todo-comments").jump_next({keywords = { "TODO", "INFO", "ERROR", "WARNING" }})
end, "Next todo comment")


-- Trouble
cat("TroubleToggle")
map("n", "<leader>xx", ":TroubleToggle<cr>", "Open trouble")
map("n", "<leader>xq", ":TroubleToggle quickfix<cr>", "Open trouble quickfix")
map("n", "<leader>xw", ":TroubleToggle workspace_diagnostics<cr>", "Open trouble workspace diagnostics")

-- Telescope
cat('Telescope')

local tsbuiltin = require('telescope.builtin')
map('n', '<leader>?', tsbuiltin.oldfiles, '[?] Find recently opened files')
map('n', '<leader><space>', tsbuiltin.buffers, '[ ] Find existing buffers')
map('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  tsbuiltin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
    layout_config = {
      preview_cutoff = 1, -- Preview should always show (unless previewer = false)

      width = function(_, max_columns, _)
        return math.min(max_columns, 120)
      end,

      height = function(_, _, max_lines)
        return math.min(max_lines, 40)
      end,
    },
  })
end, '[/] Fuzzily search in current buffer')
map('n', '<leader>sf', tsbuiltin.find_files, '[S]earch [F]iles')
map('n', '<leader>sh', tsbuiltin.help_tags, '[S]earch [H]elp')
map('n', '<leader>sw', tsbuiltin.grep_string, '[S]earch current [W]ord')
map('n', '<leader>sg', tsbuiltin.live_grep, '[S]earch by [G]rep')
map('n', '<leader>sd', tsbuiltin.diagnostics, '[S]earch [D]iagnostics')

map('n', '<leader>sk', ':Telescope keymaps<CR>', '[S]earch [K]ey Remaps') -- I know there probably exists a better way of doing this but am too lazy to find out

-- Undotree
cat('UndoTree')
map("n", "<leader>u", vim.cmd.UndotreeToggle, 'Open [U]ndotree')


-- Nvim Tree
cat('NvimTree')
map("n", "<leader>e", ":NvimTreeToggle<CR>", 'Open [E]xplorer')

-- Ufo (folding)
cat('UFO')
map("n", "zR", require("ufo").openAllFolds, "Open all folds")
map("n", "zM", require("ufo").closeAllFolds, "Close all folds")

-- Barbar (Tabs)
cat('Barbar')
map('n', '<A-,>', vim.cmd.BufferPrevious, 'Previous Buffer')
map('n', '<A-.>', vim.cmd.BufferNext, 'Next Buffer')
map('n', '<A-<>', vim.cmd.BufferMovePrevious, 'Move buffer to previous buffer')
map('n', '<A->>', vim.cmd.BufferMoveNext, 'Move buffer to next buffer')
map('n', '<A-1>', ':BufferGoto 1<CR>', 'Go to buffer 1')
map('n', '<A-2>', ':BufferGoto 2<CR>', 'Go to buffer 2')
map('n', '<A-3>', ':BufferGoto 3<CR>', 'Go to buffer 3')
map('n', '<A-4>', ':BufferGoto 4<CR>', 'Go to buffer 4')
map('n', '<A-5>', ':BufferGoto 5<CR>', 'Go to buffer 5')
map('n', '<A-6>', ':BufferGoto 6<CR>', 'Go to buffer 6')
map('n', '<A-7>', ':BufferGoto 7<CR>', 'Go to buffer 7')
map('n', '<A-8>', ':BufferGoto 8<CR>', 'Go to buffer 8')
map('n', '<A-9>', ':BufferGoto 9<CR>', 'Go to buffer 9')
map('n', '<A-0>', vim.cmd.BufferLast, 'Go to last buffer')
map('n', '<A-p>', vim.cmd.BufferPin, 'Toggle buffer pin')
map('n', '<A-c>', vim.cmd.BufferClose, 'Close buffer')
map('n', '<C-p>', vim.cmd.BufferPick, 'Magic buffer-picking mode')
