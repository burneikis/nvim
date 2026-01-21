return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			skip_confirm_for_simple_edits = true,

			default_file_explorer = true,
			columns = {
				"icon",
			},
			view_options = {
				show_hidden = true,
			},
			float = {
        border = "rounded",
				padding = 2,
				max_width = 0.7,
				max_height = 0.6,
			},
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["<C-v>"] = "actions.select_vsplit",
				["<C-s>"] = "actions.select_split",
				["<C-t>"] = "actions.select_tab",
				["<C-p>"] = "actions.preview",
				["<C-c>"] = "actions.close",
				["<C-r>"] = "actions.refresh",
				["-"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["`"] = "actions.cd",
				["~"] = "actions.tcd",
				["gs"] = "actions.change_sort",
				["gx"] = "actions.open_external",
				["g."] = "actions.toggle_hidden",
				["q"] = {
					callback = function()
						if vim.bo.modified then
							local choice = vim.fn.confirm("Save changes?", "&Yes\n&No\n&Cancel", 1)
							if choice == 1 then
								vim.cmd("write")
								require("oil.actions").close.callback()
							elseif choice == 2 then
								vim.bo.modified = false
								require("oil.actions").close.callback()
							end
						-- choice == 3 (Cancel) does nothing, stays in Oil
						else
							require("oil.actions").close.callback()
						end
					end,
					desc = "Close oil with save prompt",
				},
			},
		})

		vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })
		vim.keymap.set("n", "<leader>e", "<cmd>Oil --float<cr>", { desc = "Oil" })
	end,
}
