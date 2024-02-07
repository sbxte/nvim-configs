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

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = false -- Use tabs instead of spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 5
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

vim.o.autoread = true

vim.o.fixeol = true
vim.o.fileformat = 'unix'

vim.o.shell = 'pwsh'



-- Language specific settings

-- Rust
vim.g.rust_recommended_style = false
