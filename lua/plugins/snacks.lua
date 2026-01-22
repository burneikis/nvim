return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		lazygit = {
			enabled = true,
			config = {
				os = {
					edit = "nvim --server $NVIM --remote-send \"<cmd>lua Snacks.lazygit():hide(); vim.cmd.edit('{{filename}}')<cr>\"",
					editAtLine = "nvim --server $NVIM --remote-send \"<cmd>lua Snacks.lazygit():hide(); vim.cmd.edit('{{filename}}'); vim.cmd('normal! {{line}}G')<cr>\"",
				},
			},
		},
	},
	keys = {
		{ "<leader>g", function() Snacks.lazygit() end, desc = "Lazygit" },
		-- {
		-- 	"<leader>gf",
		-- 	function() Snacks.lazygit.log_file() end,
		-- 	desc = "Lazygit File History",
		-- },
		-- {
		-- 	"<leader>gl",
		-- 	function() Snacks.lazygit.log() end,
		-- 	desc = "Lazygit Log (cwd)",
		-- },
	},
}
