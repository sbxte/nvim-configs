-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

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
	sm = "block-blinkwait175-blinkoff150-blinkon175",
}

vim.opt.nu = true
vim.opt.rnu = false

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = false -- Use tabs instead of spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 5
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.clipboard = "" -- Do NOT use system clipboard by default

vim.o.updatetime = 1250
vim.o.timeout = true
vim.o.timeoutlen = 500

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.foldcolumn = "0"
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.o.autoread = true

vim.g.fixeol = true
vim.g.fileformat = "DOS"

if vim.loop.os_uname().sysname == "Linux" then
	vim.o.shell = "zsh"
else
	vim.o.shell = "pwsh"
end

-- Language specific settings

-- Rust
-- vim.g.rust_recommended_style = false
