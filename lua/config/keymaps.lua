local map = vim.keymap.set

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize windows
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

-- Buffer navigation
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Close buffer" })
map("n", "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", { desc = "Delete buffers to the left" })
map("n", "<leader>bl", "<cmd>BufferLineCloseRight<cr>", { desc = "Delete buffers to the right" })

-- Centered scrolling
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down centered" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up centered" })
map("n", "n", "nzzzv", { desc = "Next search result centered" })
map("n", "N", "Nzzzv", { desc = "Previous search result centered" })

-- Yank to system clipboard, delete to register only
map({ "n", "v" }, "y", '"+y', { desc = "Yank to clipboard" })
map("n", "Y", '"+y$', { desc = "Yank to end of line to clipboard" })
map("n", "yy", '"+yy', { desc = "Yank line to clipboard" })

-- Toggle options
map("n", "<leader>tw", "<cmd>set wrap!<cr>", { desc = "Toggle line wrap" })
map("n", "<leader>tf", function() vim.g.disable_autoformat = not vim.g.disable_autoformat end, { desc = "Toggle autoformat" })

-- Return to dashboard
map("n", "<leader>d", function() Snacks.dashboard() end, { desc = "Dashboard" })

-- Yank file path (relative on f, absolute on F)
map("n", "<leader>yf", function()
	local filepath = vim.fn.expand("%:.")
	vim.fn.setreg("+", filepath)
	print("Yanked relative file path: " .. filepath)
end, { desc = "Yank relative file path" })
map("n", "<leader>yF", function()
	local filepath = vim.fn.expand("%:p")
	vim.fn.setreg("+", filepath)
	print("Yanked absolute file path: " .. filepath)
end, { desc = "Yank absolute file path" })

-- QuickFix
map("n", "<leader>co", "<cmd>copen<cr>", { desc = "Open QuickFix" })
map("n", "<leader>cc", "<cmd>cclose<cr>", { desc = "Close QuickFix" })
map("n", "<leader>cn", "<cmd>cnext<cr>", { desc = "Next QuickFix item" })
map("n", "<leader>cp", "<cmd>cprev<cr>", { desc = "Previous QuickFix item" })
