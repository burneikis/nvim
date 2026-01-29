return {
  -- Override copilot.lua to use inline suggestions only
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<Tab>",
          accept_word = "<M-w>",
          accept_line = "<M-e>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<M-c>",
        },
      },
      panel = {
        enabled = false,
      },
    },
  },

  -- Remove copilot from blink.cmp sources (LazyVim's default completion)
  {
    "saghen/blink.cmp",
    optional = true,
    opts = {
      sources = {
        providers = {
          copilot = { enabled = false },
        },
      },
    },
  },
}
