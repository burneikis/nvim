return {
    "burneikis/nodejumper.nvim",
    event = "VeryLazy",
    opts = {
      dim_background = false,
    },
    keys = {
      { "S", mode = { "n", "x", "o" }, function() require("nodejumper").jump() end, desc = "Jump to treesitter node" },
    },
}
