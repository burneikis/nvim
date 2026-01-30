return {
  -- Configure blink.cmp to remove copilot from sources
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      -- Remove copilot from sources
      opts.sources = opts.sources or {}
      opts.sources.default = opts.sources.default or {}

      -- Filter out copilot from the default providers
      local filtered = {}
      for _, provider in ipairs(opts.sources.default) do
        if provider ~= "copilot" then
          table.insert(filtered, provider)
        end
      end
      opts.sources.default = filtered

      return opts
    end,
  },

  -- Configure copilot.lua for inline suggestions only
  {
    "zbirenbaum/copilot.lua",
    opts = {
      panel = {
        enabled = false, -- Disable copilot panel
      },
      suggestion = {
        enabled = true, -- Enable inline suggestions
        auto_trigger = true,
        keymap = {
          accept = "<Tab>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
    },
  },
}
