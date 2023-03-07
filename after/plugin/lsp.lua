local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
	'tsserver',
	'eslint',
	'rust_analyzer'
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete(),
})

lsp.set_preferences({
	sign_icons = { }
})

lsp.setup_nvim_cmp({
	mappings = cmp_mappings
})

lsp.on_attach( function(client,bufnr) 
	print("lsp.on_attach")

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	local opts = { buffer  = bufnr, noremap = true, silent = true }

	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
  vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
  vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
  vim.keymap.set('n', 'gt', function() vim.lsp.buf.type_definition() end, opts)
  vim.keymap.set("n", ";;", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set('n', ';r', function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set('n', ';f', function() vim.lsp.buf.formatting() end, opts)
  vim.keymap.set('n', ';e', function() vim.diagnostic.open_float() end, opts)
end)

lsp.setup()

