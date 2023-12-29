require('bufferline').setup {
	options = {
		separator_style = 'slant',
		indicator = {
			style = 'icon'
		},
		tab_size = 20,
		truncate_names = false,
		diagnostics = 'nvim_lsp',
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
		always_show_bufferline = true
	}
}
