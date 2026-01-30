-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Yank to clipboard (but not delete or change)
vim.keymap.set({ "n", "v" }, "y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("n", "Y", '"+Y', { desc = "Yank line to clipboard" })

-- Yank file paths
vim.keymap.set("n", "<leader>yp", function()
  local path = vim.fn.expand("%:.")
  vim.fn.setreg("+", path)
  vim.notify('Yanked relative path: ' .. path, vim.log.levels.INFO)
end, { desc = "Yank relative path" })

vim.keymap.set("n", "<leader>yP", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify('Yanked full path: ' .. path, vim.log.levels.INFO)
end, { desc = "Yank full path" })
