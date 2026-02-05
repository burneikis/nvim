return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			javascript = { "prettier" },
			typescript = { "prettier" },
		},
		format_on_save = function()
			if vim.g.disable_autoformat then return end
			return { timeout_ms = 500, lsp_fallback = true }
		end,
	},
}
