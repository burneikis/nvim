return {
	dir = vim.fn.expand("~/Code/88"),
	enabled = false,
	config = function()
		require("88").setup({
			provider = require("88").Providers.ClaudeCodeProvider,
			keymap = "<leader>88",
		})
	end,
}
