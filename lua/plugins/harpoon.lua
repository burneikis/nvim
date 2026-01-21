return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = true,
			},
		})

		vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon add" })

		vim.keymap.set("n", "<leader>h", function()
			harpoon.ui:toggle_quick_menu(harpoon:list(), {
				ui_nav_wrap = true,
				title = " Harpoon ",
				border = "rounded",
				title_pos = "center",
			})
		end, { desc = "Harpoon" })

		-- Number keys to select files when harpoon menu is open
		harpoon:extend({
			UI_CREATE = function(cx)
				for i = 1, 5 do
					vim.keymap.set("n", tostring(i), function() harpoon:list():select(i) end, { buffer = cx.bufnr, desc = "Harpoon select " .. i })
				end
			end,
		})

		vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon file 1" })

		vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon file 2" })

		vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon file 3" })

		vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon file 4" })

		vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end, { desc = "Harpoon file 5" })

		vim.keymap.set("n", "[h", function() harpoon:list():prev() end, { desc = "Harpoon previous" })

		vim.keymap.set("n", "]h", function() harpoon:list():next() end, { desc = "Harpoon next" })
	end,
}
