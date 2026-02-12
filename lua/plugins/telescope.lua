return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local pickers = require("telescope.pickers")
		local finders = require("telescope.finders")
		local conf = require("telescope.config").values
		local previewers = require("telescope.previewers")

		telescope.setup({
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
				entry_prefix = " ",
				path_display = { "truncate" },
				sorting_strategy = "ascending",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
					},
					width = 0.87,
					height = 0.80,
				},
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
					n = {
						["j"] = actions.move_selection_next,
						["k"] = actions.move_selection_previous,
						["<Esc>"] = actions.close,
						["q"] = actions.close,
					},
				},
			},
			pickers = {
				find_files = {
					hidden = true,
					file_ignore_patterns = { "%.git/" },
				},
			},
		})

		telescope.load_extension("fzf")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Files" })
		vim.keymap.set("n", "<leader>ft", builtin.live_grep, { desc = "Text (grep)" })
		vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
		vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Commands" })
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
		vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Document symbols" })
		vim.keymap.set("n", "<leader>fg", function()
			if vim.g.gitsigns_merge_base then
				-- Show files changed relative to merge-base with diff preview
				local merge_base = vim.fn.systemlist("git merge-base HEAD main")[1]
				if merge_base and merge_base ~= "" then
					pickers
						.new({}, {
							prompt_title = "Changed Files (vs merge-base " .. merge_base:sub(1, 7) .. ")",
							finder = finders.new_oneshot_job({ "git", "diff", "--name-only", merge_base }),
							sorter = conf.file_sorter({}),
							previewer = previewers.new_termopen_previewer({
								title = "Git File Diff Preview",
								get_command = function(entry) return { "git", "--no-pager", "diff", merge_base, "--", entry.value } end,
							}),
						})
						:find()
				else
					vim.notify("Could not determine merge-base", vim.log.levels.WARN)
					builtin.git_status()
				end
			else
				-- Default behavior: show working tree status
				builtin.git_status()
			end
		end, { desc = "Git status" })
	end,
}
