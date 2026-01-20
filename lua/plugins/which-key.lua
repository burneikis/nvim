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
    },
  },
}
