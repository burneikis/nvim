local M = {}

local function toggle_desc(base, is_enabled)
	return function()
		local state = is_enabled() and "●" or "○"
		local padding = 22 - #base - 1
		return base .. string.rep(" ", math.max(padding, 1)) .. state
	end
end

local map = vim.keymap.set

map("n", "<leader>tw", function()
	vim.wo.wrap = not vim.wo.wrap
	print("Line wrap " .. (vim.wo.wrap and "enabled" or "disabled"))
end)
map("n", "<leader>tf", function()
	vim.g.disable_autoformat = not vim.g.disable_autoformat
	print("Autoformat " .. (vim.g.disable_autoformat and "disabled" or "enabled"))
end)
map("n", "<leader>ti", function()
	vim.g.disable_trouble_inline = not vim.g.disable_trouble_inline

	-- Toggle virtual text (inline diagnostics)
	vim.diagnostic.config({
		virtual_text = not vim.g.disable_trouble_inline,
	})

	print("Trouble inline diagnostics " .. (vim.g.disable_trouble_inline and "disabled" or "enabled"))
end)
map("n", "<leader>tm", function()
	local gs = package.loaded.gitsigns
	if not gs then
		vim.notify("gitsigns not loaded", vim.log.levels.WARN)
		return
	end

	if vim.g.gitsigns_merge_base then
		gs.reset_base(true)
		vim.g.gitsigns_merge_base = false
		vim.notify("Gitsigns base: reset to index (default)")
	else
		local merge_base = vim.fn.systemlist("git merge-base HEAD main")[1]
		if merge_base and merge_base ~= "" then
			gs.change_base(merge_base, true)
			vim.g.gitsigns_merge_base = true
			vim.notify("Gitsigns base: merge-base with main (" .. merge_base:sub(1, 7) .. ")")
		else
			vim.notify("Could not determine merge-base", vim.log.levels.WARN)
		end
	end
end)
map("n", "<leader>td", function()
	local gs = package.loaded.gitsigns
	if not gs then
		vim.notify("gitsigns not loaded", vim.log.levels.WARN)
		return
	end

	if vim.wo.diff then
		vim.cmd("diffoff!")
		for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
			local buf = vim.api.nvim_win_get_buf(win)
			local name = vim.api.nvim_buf_get_name(buf)
			if name:match("^gitsigns://") then
				vim.api.nvim_win_close(win, true)
			end
		end
		vim.g.gitsigns_diff_open = false
		vim.notify("Diff view closed")
	else
		if vim.g.gitsigns_merge_base then
			local merge_base = vim.fn.systemlist("git merge-base HEAD main")[1]
			if merge_base and merge_base ~= "" then
				gs.diffthis(merge_base)
				vim.notify("Diff view: merge-base (" .. merge_base:sub(1, 7) .. ")")
			else
				vim.notify("Could not determine merge-base", vim.log.levels.WARN)
				return
			end
		else
			gs.diffthis()
			vim.notify("Diff view: index")
		end
		vim.g.gitsigns_diff_open = true
	end
end)

M.keymaps = {
	{
		"<leader>tw",
		desc = toggle_desc("Line wrap", function() return vim.wo.wrap end),
	},
	{
		"<leader>tf",
		desc = toggle_desc("Autoformat", function() return not vim.g.disable_autoformat end),
	},
	{
		"<leader>ti",
		desc = toggle_desc("Trouble inline", function()
			return not vim.g.disable_trouble_inline
		end),
	},
	{
		"<leader>tm",
		desc = toggle_desc("Merge-base signs", function() return vim.g.gitsigns_merge_base end),
	},
	{
		"<leader>td",
		desc = toggle_desc("Diff view", function() return vim.g.gitsigns_diff_open end),
	},
}

return M
