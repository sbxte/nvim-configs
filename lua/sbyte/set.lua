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

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300



-- Custom remaps
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "[E]xplorer"})
vim.keymap.set("n", "<leader>vvcs", ":e ~/appdata/local/nvim/lua/sbyte/set.lua<CR>", { desc = "Neo[V]im [C]onfig [S]et.lua"})
vim.keymap.set("n", "<leader>vvcp", ":e ~/appdata/local/nvim/lua/sbyte/packer.lua<CR>", { desc = "Neo[V]im [C]onfig [P]acker.lua"})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

vim.keymap.set("n", "tn", ":tabnew<CR>")
vim.keymap.set("n", "tc", ":tabclose<CR>")
vim.keymap.set("n", "tt", ":tabn<CR>")
vim.keymap.set("n", "tT", ":tabp<CR>")

vim.keymap.set("i", "<C-c>", "<Esc>") -- <C-[> is available too btw

vim.keymap.set("n", "Q", "<Nop>")

-- Git Fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git);


-- Todo comments
vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev({keywords = { "TODO", "ERROR", "WARNING" }})
end, { desc = "Previous todo/warning/error todo comment" })

vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next({keywords = { "TODO", "ERROR", "WARNING" }})
end, { desc = "Next todo/error/warning todo comment" })


-- Trouble
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)

-- Telescope

local tsbuiltin = require('telescope.builtin')
vim.keymap.set('n', '<leader>?', tsbuiltin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', tsbuiltin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  tsbuiltin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })
vim.keymap.set('n', '<leader>sf', tsbuiltin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', tsbuiltin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', tsbuiltin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', tsbuiltin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', tsbuiltin.diagnostics, { desc = '[S]earch [D]iagnostics' })

vim.keymap.set('n', '<leader>sk', ':Telescope keymaps<CR>') -- I know there probably exists a better way of doing this but am too lazy to find out

-- Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
