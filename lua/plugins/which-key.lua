local function harpoon_desc(n)
	return function()
		local ok, harpoon = pcall(require, "harpoon")
		if ok then
			local item = harpoon:list().items[n]
			if item then return vim.fn.fnamemodify(item.value, ":t") end
		end
		return "Harpoon file " .. n
	end
end

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
			{ "<leader>c", group = "quickfix" },
			{ "<leader>1", desc = harpoon_desc(1) },
			{ "<leader>2", desc = harpoon_desc(2) },
			{ "<leader>3", desc = harpoon_desc(3) },
			{ "<leader>4", desc = harpoon_desc(4) },
			{ "<leader>5", desc = harpoon_desc(5) },
			{ "<leader>t", group = "toggle" },
			{ "<leader>s", group = "split" },
			{ "<leader>9", group = "99" },
			{ "<leader>b", group = "buffer" },
			{ "<leader>y", group = "yank file path" },
		},
	},
}
