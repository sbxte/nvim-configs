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

vim.opt.updatetime = 50


-- Custom remaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

-- vim.keymap.set("i", "<C-c>", "<Esc>")
-- <C-[> instead


-- Git Fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git);


-- Todo comments

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev({keywords = { "TODO", "ERROR", "WARNING" }})
end, { desc = "Previous todo/warning/error todo comment" })

vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next({keywords = { "TODO", "ERROR", "WARNING" }})
end, { desc = "Next todo/error/warning todo comment" })
