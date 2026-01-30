return {
  {
    "smoka7/hop.nvim",
    version = "*",
    opts = {
      keys = "etovxqpdygfblzhckisuran",
    },
    config = function(_, opts)
      require("hop").setup(opts)
    end,
    keys = {
      {
        "<leader>hw",
        function()
          require("hop").hint_words()
        end,
        desc = "Hop to word",
      },
      {
        "<leader>hl",
        function()
          require("hop").hint_lines()
        end,
        desc = "Hop to line",
      },
      {
        "<leader>hc",
        function()
          require("hop").hint_char1()
        end,
        desc = "Hop to character",
      },
      {
        "<leader>hp",
        function()
          require("hop").hint_patterns()
        end,
        desc = "Hop to pattern",
      },
    },
  },
}
