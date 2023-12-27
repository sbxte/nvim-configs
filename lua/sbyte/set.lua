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

vim.o.fixeol = false

-- Custom remaps
local tsbuiltin = require('telescope.builtin')
local tsx = require('telescope').extensions
local trouble = require('trouble')
local gs = require('gitsigns')

local category = "Editor"
local cat = function(name) category = name end
local map = function(mode, l, r, desc)
  if desc then
    desc = category .. ": " .. desc
  end

  vim.keymap.set(mode, l, r, { desc = desc, remap = false, silent = true })
end

map('n', "<leader>vvcc", function()
  require('telescope').extensions.file_browser.file_browser { path = '~/appdata/local/nvim/' }
end, 'Neo[V]im [C]onfig')
map("n", "<leader>vvcs", ":e ~/appdata/local/nvim/lua/sbyte/set.lua<CR>", "Neo[V]im [C]onfig [S]et.lua")
map("n", "<leader>vvcp", ":e ~/appdata/local/nvim/lua/sbyte/packer.lua<CR>", "Neo[V]im [C]onfig [P]acker.lua")
map('n', '<leader>vvci', ':e ~/appdata/local/nvim/lua/sbyte/init.lua<CR>', 'Neo[V]im [C]onfig [I]nit.lua')
map('n', '<leader>vvca', function()
  require('telescope').extensions.file_browser.file_browser { path = '~/appdata/local/nvim/after/plugin/' }
end, 'Neo[V]im [C]onfig [A]fter Lua')
map("n", "<leader>vvcl", ":e ~/appdata/local/nvim/after/plugin/lsp.lua<CR>", "Neo[V]im [C]onfig [L]sp.lua")
map("n", "<leader>vvct", ":e ~/appdata/local/nvim/after/plugin/telescope.lua<CR>", "Neo[V]im [C]onfig [T]elescope.lua")

map("v", "J", ":m '>+1<CR>gv=gv", "Move selected lines down")
map("v", "K", ":m '<-2<CR>gv=gv", "Move selected lines up")

map('n', 'H', '0', 'Start of line')
map('n', 'L', '$', 'End of line')

map("n", "J", "mzJ`zdmz", "Custom [J]")
map("n", "<C-d>", "<C-d>zz", "Scroll down and center cursor")
map("n", "<C-u>", "<C-u>zz", "Scroll up and center cursor")

map("v", "<leader>yy", "\"+y", "Yank to clipboard")
map("v", "<leader>yp", "\"_d\"+p", "Paste from clipboard")
map("v", "<leader>yP", "\"_d\"+P", "Paste from clipboard")
map("n", "<leader>yp", "\"+p", "Paste from clipboard")
map("n", "<leader>yP", "\"+P", "Paste from clipboard")

map("n", "t]", ":bn<CR>", "Next buffer")
map("n", "t[", ":bp<CR>", "Previous buffer")
map("n", "tl", ":ls<CR>", "List buffers")
map('n', 'td', function ()
  local bufnr = vim.fn.bufnr()
  vim.cmd('bn')
  vim.cmd('bd' .. bufnr)
end, "Delete buffer")

map('n', 'tt]', ':tabn<cr>', 'Next tab')
map('n', 'tt[', ':tabp<cr>', 'Previous tab')
map('n', 'ttn', ':tabnew<cr>', 'New tab')
map('n', 'ttd', ':tabc<cr>', 'Close tab')

map({ "n", "v" }, "<M-j>", "5j");
map({ "n", "v" }, "<M-k>", "5k");

map('n', '<C-w>f', function ()
  vim.cmd('tab split')
  vim.cmd('tabclose #')
end, '[F]ullscreen window')

map("n", "Q", ":q!<CR>", "Quit file without writing")
map("n", "q", "<Nop>") -- This is infuriating
map("n", "<C-s>", ":w<CR>", "Write file")

-- Git Fugitive
cat("GitFugitive")
map("n", "<leader>gg", vim.cmd.Git, "Open [G]it");

-- Gitsigns
map({'n', 'v'}, '<leader>gs', gs.stage_hunk, 'Stage hunk')
map({'n', 'v'}, '<leader>gr', gs.reset_hunk, 'Reset hunk')
map('n', '<leader>gS', gs.stage_buffer, 'Stage buffer')
map('n', '<leader>gu', gs.undo_stage_hunk, 'Undo stage hunk')
map('n', '<leader>gr', gs.reset_hunk, 'Reset hunk')
map('n', '<leader>gR', gs.reset_buffer, 'Reset buffer')
map('n', '<leader>gp', gs.preview_hunk, 'Preview hunk')
map('n', '<leader>gb', gs.toggle_current_line_blame, 'Toggle blame line')
map('n', '<leader>gB', function() gs.blame_line{full=true} end, 'Toggle blame')
map('n', '<leader>gd', gs.diffthis, 'Diff')
map('n', '<leader>gD', function() gs.diffthis('~') end, 'Diff ~')
-- map('n', '<leader>td', gs.toggle_deleted)



-- Todo comments
cat("TodoComment")
do
  local keywords = { "TODO", "INFO", "ERROR", "WARNING" }
  local todo = require('todo-comments')
  map("n", "<leader>t[", function() todo.jump_prev { keywords } end, "Previous todo comment")
  map("n", "<leader>t]", function() todo.jump_next { keywords } end, "Next todo comment")
end


-- Trouble
cat("Trouble")
map("n", "<leader>xx", trouble.toggle, "Toggle menu")
map("n", "<leader>xq", function() trouble.toggle('quickfix') end, "Open [Q]uickfix")
map("n", "<leader>xw", function() trouble.toggle('workspace_diagnostics') end, "Open [W]orkspace diagnostics")
map('n', '<leader>xd', function() trouble.toggle('document_diagnostics') end, 'Open [D]ocument diagnostics')
map('n', '<leader>xl', function() trouble.toggle('loclist') end, 'Open [L]ocation list')
map('n', '<leader>xr', function() trouble.toggle('lsp_references') end, 'Lsp [R]eferences')

-- Telescope
cat('Telescope')

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
map('n', '<leader>sg', tsbuiltin.live_grep, '[S]earch [G]rep')
map('n', '<leader>sd', tsbuiltin.diagnostics, '[S]earch [D]iagnostics')
map('n', '<leader>sk', tsbuiltin.keymaps, '[S]earch [K]eymaps') -- I know there probably exists a better way of doing this but am too lazy to find out
map('n', '<leader>u', tsx.undo.undo, 'Telescope [U]ndo')
map('n', '<leader>se', tsx.file_browser.file_browser, '[S]earch File Browser ([E]xplorer)')
map('n', '<leader>st', tsx['telescope-tabs'].list_tabs, '[S]earch [T]abs')


-- LSP
map('n', "<C-k>", vim.lsp.buf.signature_help, 'Signature Documentation (Help)')
map('n', "K", vim.lsp.buf.hover, "Hover Documentation")
map('n', '<leader>ld', tsbuiltin.lsp_definitions, "[L]sp [D]efinition")
map('n', '<leader>lD', vim.lsp.buf.declaration, "[L]sp [D]eclaration")
map('n', '<leader>li', tsbuiltin.lsp_implementations, "[L]sp [I]implementation")
map('n', '<leader>lr', tsbuiltin.lsp_references, "[L]sp [R]eferences")
map('n', '<leader>lt', tsbuiltin.lsp_type_definitions, "[L]sp [T]ype Definition")
map('n', ";ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
map('n', ';rn', vim.lsp.buf.rename, "[R]e[n]ame")
map('n', ';f', vim.lsp.buf.format, "[F]ormat")
map('n', '<leader>lf', vim.diagnostic.open_float, "Open [F]loating diagnostic message")
-- map("]d", vim.diagnostic.goto_next, "Goto previous diag message")
-- map("[d", vim.diagnostic.goto_prev, "Goto next diag message")



-- Nvim Tree
cat('NvimTree')
map("n", "<leader>e", ":NvimTreeToggle<CR>", 'Open [E]xplorer')

-- Ufo (folding)
cat('UFO')
map("n", "zR", require("ufo").openAllFolds, "Open all folds")
map("n", "zM", require("ufo").closeAllFolds, "Close all folds")
