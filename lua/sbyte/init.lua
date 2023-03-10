require("sbyte.packer")
require("sbyte.set")

-- Auto cmds

local autocmd = vim.api.nvim_create_autocmd
local sbyte = vim.api.nvim_create_augroup('dan', {})

-- Automatically remove all trailing whitespaces
autocmd({"BufWritePre"}, {
    group = sbyte,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
