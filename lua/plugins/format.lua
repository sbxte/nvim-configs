return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				fish = { "fish_indent" },
				sh = { "shfmt" },
				c = { "clang_format" },
				cpp = { "clang_format" },
			},
		},
	},
}
