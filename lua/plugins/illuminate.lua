return {
	"RRethy/vim-illuminate",
	config = function()
		local illuminate = require("illuminate")

		illuminate.configure({
			providers = { "lsp", "treesitter", "regex" },
			delay = 100,
			filetypes_denylist = {
				"snacks_dashboard",
			},
		})

		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = "*.component.ts",
			callback = function()
				illuminate.configure({
					providers = { "treesitter", "regex" },
					delay = 100,
				})
				vim.opt_local.iskeyword:append("-")
			end,
		})

		-- Restore LSP for other TS files
		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = "*.ts",
			callback = function()
				if not vim.fn.expand("%"):match("%.component%.ts$") then illuminate.configure({
					providers = { "lsp", "treesitter", "regex" },
					delay = 100,
				}) end
			end,
		})
	end,
}
