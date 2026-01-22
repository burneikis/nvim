return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
	config = function()
		local harpoon = require("harpoon")
		local devicons = require("nvim-web-devicons")

		-- Shorten path for display in harpoon menu
		local function shorten_path(path)
			-- Get filename and parent directory for context
			local parts = vim.split(path, "/")
			if #parts <= 2 then return path end
			-- Show last 2 components (parent/filename)
			return parts[#parts - 1] .. "/" .. parts[#parts]
		end

		-- Get icon and highlight group for a file path
		local function get_icon(path)
			local filename = vim.fn.fnamemodify(path, ":t")
			local ext = vim.fn.fnamemodify(path, ":e")
			local icon, hl = devicons.get_icon(filename, ext, { default = true })
			return icon or "", hl
		end

		harpoon:setup({
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = true,
			},
			default = {
				display = function(list_item)
					return shorten_path(list_item.value)
				end,
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

		-- Namespace for virtual text
		local ns = vim.api.nvim_create_namespace("harpoon_icons")

		-- Add virtual text icons to harpoon buffer
		local function add_icons_to_buffer(bufnr)
			vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
			local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
			local list = harpoon:list()

			for i, _ in ipairs(lines) do
				local item = list.items[i]
				if item then
					local icon, hl = get_icon(item.value)
					vim.api.nvim_buf_set_extmark(bufnr, ns, i - 1, 0, {
						virt_text = { { icon .. " " .. i .. " ", hl or "Normal" } },
						virt_text_pos = "inline",
					})
				end
			end
		end

		-- Number keys to select files when harpoon menu is open
		harpoon:extend({
			UI_CREATE = function(cx)
				-- Disable vim line numbers so our custom format shows cleanly
				vim.api.nvim_set_option_value("number", false, { win = cx.win_id })
				vim.api.nvim_set_option_value("relativenumber", false, { win = cx.win_id })

				-- Add icons as virtual text
				add_icons_to_buffer(cx.bufnr)

				-- Update icons when buffer changes
				vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
					buffer = cx.bufnr,
					callback = function()
						add_icons_to_buffer(cx.bufnr)
					end,
				})

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
