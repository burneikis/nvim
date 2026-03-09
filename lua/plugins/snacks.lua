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
		dashboard = {
			enabled = true,
			width = 60,
			row = nil,
			col = nil,
			pane_gap = 4,
			preset = {
				header = [[
 ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
 ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
 ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
 ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
 ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
 ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{ icon = " ", key = "t", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
					{ icon = " ", key = "g", desc = "Lazy Git", action = ":lua Snacks.lazygit()" },
					{ icon = " ", key = "o", desc = "Oil Explorer", action = ":Oil --float" },
					{ icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
					{ icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
					{ icon = " ", key = "l", desc = "Lazy", action = ":Lazy" },
					{ icon = " ", key = "s", desc = "Restore Session", action = ":lua require('persistence').load()" },
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
			},
		},
	},
	keys = {
		{ "<leader>g", function() Snacks.lazygit() end, desc = "Lazygit" },
	},
}
