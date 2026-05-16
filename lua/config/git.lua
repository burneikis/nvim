local M = {}

local _default_branch = nil

function M.default_branch()
	if _default_branch then return _default_branch end
	local result = vim.fn.systemlist("git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null")
	if vim.v.shell_error == 0 and #result > 0 then
		_default_branch = result[1]:match("refs/remotes/origin/(.+)")
	end
	if not _default_branch then _default_branch = "main" end
	return _default_branch
end

return M
