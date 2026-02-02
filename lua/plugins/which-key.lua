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
			{ "<leader>1", hidden = true },
			{ "<leader>2", hidden = true },
			{ "<leader>3", hidden = true },
			{ "<leader>4", hidden = true },
			{ "<leader>5", hidden = true },
			{ "<leader>9", group = "99" },
			{ "<leader>b", group = "buffer" },
			{ "<leader>y", group = "yank file path" },
		},
	},
}
