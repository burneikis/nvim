return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		preset = "helix",
		icons = {
			mappings = false,
			rules = false,
		},
		win = {
			border = "rounded",
		},
		spec = {
			{ "<leader>f", group = "find" },
			{ "<leader>g", group = "git" },
			{ "<leader>c", group = "code" },
			{ "<leader>x", group = "diagnostics" },
			{ "<leader>q", group = "quit/session" },
      { "<leader>c", group = "quickfix" },
			{
				"<leader>1",
				desc = function()
					local ok, harpoon = pcall(require, "harpoon")
					if ok then
						local item = harpoon:list().items[1]
						if item then return vim.fn.fnamemodify(item.value, ":t") end
					end
					return "Harpoon file 1"
				end,
			},
			{
				"<leader>2",
				desc = function()
					local ok, harpoon = pcall(require, "harpoon")
					if ok then
						local item = harpoon:list().items[2]
						if item then return vim.fn.fnamemodify(item.value, ":t") end
					end
					return "Harpoon file 2"
				end,
			},
			{
				"<leader>3",
				desc = function()
					local ok, harpoon = pcall(require, "harpoon")
					if ok then
						local item = harpoon:list().items[3]
						if item then return vim.fn.fnamemodify(item.value, ":t") end
					end
					return "Harpoon file 3"
				end,
			},
			{
				"<leader>4",
				desc = function()
					local ok, harpoon = pcall(require, "harpoon")
					if ok then
						local item = harpoon:list().items[4]
						if item then return vim.fn.fnamemodify(item.value, ":t") end
					end
					return "Harpoon file 4"
				end,
			},
			{
				"<leader>5",
				desc = function()
					local ok, harpoon = pcall(require, "harpoon")
					if ok then
						local item = harpoon:list().items[5]
						if item then return vim.fn.fnamemodify(item.value, ":t") end
					end
					return "Harpoon file 5"
				end,
			},
			{
				"<leader>y",
				group = "yank file path",
			},
		},
	},
}
