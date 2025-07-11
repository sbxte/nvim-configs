return {
	{
		"mrcjkb/rustaceanvim",
		opts = {
			server = {
				default_settings = {
					-- rust-analyzer language server configuration
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
							loadOutDirsFromCheck = true,
							runBuildScripts = true,
						},
						-- Add clippy lints for Rust.
						checkOnSave = {
							allFeatures = true,
						},
						check = {
							-- Clippy is insanely slow to be constantly called in large projects
							-- command = "clippy",
							-- extraArgs = { "--no-deps" },
						},
						diagnostics = {
							disabled = { "proc-macro-disabled" },
						},
						imports = {
							granularity = {
								group = "module",
							},
						},
						inlayHints = { -- This is actually so annoying wtf
							chainingHints = {
								enable = false,
							},
							closingBraceHints = {
								enable = false,
							},
							parameterHints = {
								enable = false,
							},
							typeHints = {
								enable = false,
							},
						},
						procMacro = {
							enable = true,
							ignored = {
								["async-trait"] = { "async_trait" },
								["napi-derive"] = { "napi" },
								["async-recursion"] = { "async_recursion" },
							},
						},
					},
				},
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			server = {
				rust_analyzer = { enabled = false },
			},
		},
	},
}
