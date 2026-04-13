return {
	-- This is the built-in default in LazyVim's conform.nvim spec
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua", stop_after_first = true },
				fish = { "fish_indent", stop_after_first = true },
				python = {
					-- To fix auto-fixable lint errors.
					"ruff_fix",
					-- To run the Ruff formatter.
					"ruff_format",
					-- To organize the imports.
					"ruff_organize_imports",
					"ruff",
				},
				sh = { "shfmt" },
				javascript = { "prettier", stop_after_first = true },
				html = { "prettier", stop_after_first = true },
				css = { "prettier", stop_after_first = true },
				typescript = { "prettier", stop_after_first = true },
				-- Other filetypes may fallback to LSP formatting if available
				markdown = { "prettier", stop_after_first = true },
			},
			default_format_opts = {
				timeout_ms = 3000,
				async = false,
				quiet = false,
				lsp_format = "fallback", -- Use LSP if no conform formatter is available
			},
		},
	},
}
