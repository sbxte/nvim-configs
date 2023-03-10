require("dan.packer")
require("dan.set")

-- Auto cmds

local autocmd = vim.api.nvim_create_autocmd
local dan = vim.api.nvim_create_augroup('dan', {})

-- Automatically remove all trailing whitespaces
autocmd({"BufWritePre"}, {
    group = dan,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
