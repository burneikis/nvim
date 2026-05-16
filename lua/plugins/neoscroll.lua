return {
	"karb94/neoscroll.nvim",
	event = "VeryLazy",
	opts = {
		mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "zt", "zz", "zb" },
		hide_cursor = true,
		stop_eof = true,
		respect_scrolloff = false,
		cursor_scrolls_alone = true,
		easing_function = "sine",
		post_hook = function(info)
			if info == "center" then vim.cmd("normal! zz") end
		end,
	},
	config = function(_, opts)
		local neoscroll = require("neoscroll")
		neoscroll.setup(opts)

		local keymap = {
			["<C-u>"] = function() neoscroll.ctrl_u({ duration = 250, info = "center" }) end,
			["<C-d>"] = function() neoscroll.ctrl_d({ duration = 250, info = "center" }) end,
		}

		for key, func in pairs(keymap) do
			vim.keymap.set({ "n", "x" }, key, func, { desc = "Neoscroll " .. key })
		end
	end,
}
