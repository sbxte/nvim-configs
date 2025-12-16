return {
	{
		"stevearc/oil.nvim",
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
		-- Optional dependencies
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			keymaps = {
				["g?"] = { "actions.show_help", mode = "n" },
				["<CR>"] = "actions.select",
				["<gv>"] = { "actions.select", opts = { vertical = true } },
				["<gs>"] = { "actions.select", opts = { horizontal = true } },
				["<gt>"] = { "actions.select", opts = { tab = true } },
				["gp"] = "actions.preview",
				["<C-c>"] = { "actions.close", mode = "n" },
				["r"] = "actions.refresh",
				["-"] = { "actions.parent", mode = "n" },
				["_"] = { "actions.open_cwd", mode = "n" },
				["`"] = { "actions.cd", mode = "n" },
				["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
				["gs"] = { "actions.change_sort", mode = "n" },
				["gx"] = "actions.open_external",
				["g."] = { "actions.toggle_hidden", mode = "n" },
				["g\\"] = { "actions.toggle_trash", mode = "n" },
			},
			use_default_keymaps = false,
			watch_for_changes = true,
		},
		keys = {
			{
				"<leader>e",
				function()
					require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
				end,
				desc = "Explorer Neotree",
				expr = false,
			},
			{
				"<leader>E",
				function()
					local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
					local start = bufname.find(bufname, "oil:/")
					if start == 1 then
						require("oil").close()
					else
						---@type oil.OpenOpts
						local opts = {
							-- preview = {
							-- 	split = "belowright",
							-- 	vertical = true,
							-- },
						}
						require("oil").open(nil, opts, nil)
					end
				end,
				desc = "Explorer Oil",
				expr = false,
			},
			{ "<leader>fe", "<leader>e", desc = "Explorer Neotree", expr = true },
			{ "<leader>fE", "<leader>E", desc = "Explorer Oil", expr = true },
		},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		keys = {
			{ "<leader>e", false },
			{ "<leader>E", false },
			{ "<leader>fe", false },
			{ "<leader>fE", false },
		},
	},
}
