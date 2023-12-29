require('sbyte.options')
require("sbyte.package") -- Lazy.nvim
require("sbyte.set")

-- Auto cmds

local autocmd = vim.api.nvim_create_autocmd
local editing = vim.api.nvim_create_augroup('editing', {})

-- Automatically remove all trailing whitespaces
autocmd({"BufWritePre"}, {
    group = editing,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
