return {
	"ThePrimeagen/99",
	config = function()
		local _99 = require("99")

		local cwd = vim.uv.cwd()

		-- Ensure tmp directory exists for 99 plugin
		local tmp_dir = cwd .. "/tmp"
		vim.fn.mkdir(tmp_dir, "p")
		local basename = vim.fs.basename(cwd)

		local Providers = require("99.providers")

		_99.setup({
			logger = {
				level = _99.DEBUG,
				path = "/tmp/" .. basename .. ".99.debug",
				print_on_error = true,
			},

			-- Use Claude Code CLI as the provider
			provider = Providers.ClaudeCodeProvider,
			model = "haiku",

			completion = {

				custom_rules = {
					"scratch/custom_rules/",
				},

				source = "cmp",
			},

			md_files = {
				"AGENT.md",
			},
		})

		vim.keymap.set("n", "<leader>9f", function() _99.fill_in_function() end)
		vim.keymap.set("v", "<leader>9v", function() _99.visual() end)
		vim.keymap.set("v", "<leader>9s", function() _99.stop_all_requests() end)
	end,
}
