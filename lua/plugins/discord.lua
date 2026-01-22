return {
	{
		"vyfor/cord.nvim",
		lazy = false,
		build = ':Cord update',
		opts = {
			display = {
				theme = "default",
				flavor = "dark",
			},
			editor = {
				tooltip = "fingers go brrr",
			},
			text = {
				editing = function(opts)
					-- Hide certain file names
					local hidden_files = { "markdown", "md" }
					if vim.list_contains(hidden_files, opts.filetype) then
						return "Editing " .. opts.filetype .. " file"
					else
						return "Editing " .. opts.filename
					end
				end,
			},
		},
	},
}
