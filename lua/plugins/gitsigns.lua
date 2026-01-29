return {
  "lewis6991/gitsigns.nvim",
  opts = {
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol",
      delay = 300,
    },
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
  },
  keys = {
    { "]g", "<cmd>Gitsigns next_hunk<cr>", desc = "Next Git Hunk" },
    { "[g", "<cmd>Gitsigns prev_hunk<cr>", desc = "Prev Git Hunk" },
  },
}
