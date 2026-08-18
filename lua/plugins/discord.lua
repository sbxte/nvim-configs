local is_hidden = function()
	local files = vim.fs.find(".nodcrpc", {
		path = vim.api.nvim_buf_get_name(0),
		upward = true,
		limit = math.huge,
	})

	return #files > 0
end

return {
	{
		"vyfor/cord.nvim",
		lazy = false,
		build = ":Cord update",
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
					if is_hidden() then
						return "Editing file"
					else
						return "Editing " .. opts.filename
					end
				end,
				workspace = function(opts)
					if is_hidden() then
						return "Wololo"
					else
						return "In " .. opts.workspace
					end
				end,
				viewing = function(opts)
					if is_hidden() then
						return "Viewing file"
					else
						return "Viewing " .. opts.filename
					end
				end,
			},
		},
	},
}
