-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear Search Highlight" })

-- Move lines up/down
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Line Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Line Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Selection Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Selection Up" })

-- Yank to system clipboard
map({ "n", "v" }, "y", '"+y', { desc = "Yank to Clipboard" })
map("n", "Y", '"+Y', { desc = "Yank Line to Clipboard" })
map("n", "yy", '"+yy', { desc = "Yank Line to Clipboard" })

-- Yank file paths
map("n", "<leader>yf", '<cmd>let @+ = expand("%")<cr>', { desc = "Yank Relative Path" })
map("n", "<leader>yF", '<cmd>let @+ = expand("%:p")<cr>', { desc = "Yank Absolute Path" })

-- Quickfix navigation
map("n", "<leader>co", "<cmd>copen<cr>", { desc = "Open Quickfix" })
map("n", "<leader>cc", "<cmd>cclose<cr>", { desc = "Close Quickfix" })
map("n", "<leader>cn", "<cmd>cnext<cr>", { desc = "Next Quickfix" })
map("n", "<leader>cp", "<cmd>cprev<cr>", { desc = "Prev Quickfix" })

-- File explorer
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Explorer" })
