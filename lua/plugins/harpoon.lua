local function harpoon_select(index)
  return function()
    require("harpoon"):list():select(index)
  end
end

return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>H",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon quick menu",
      },
      {
        "<leader>a",
        function()
          local harpoon = require("harpoon")
          local list = harpoon:list()
          local current_file = vim.fn.expand("%:t")
          list:add()
          local index = list:length()
          vim.notify("Harpooned " .. current_file .. " to " .. index, vim.log.levels.INFO)
        end,
        desc = "Add file to Harpoon",
      },
      { "<leader>1", harpoon_select(1), desc = "Harpoon 1" },
      { "<leader>2", harpoon_select(2), desc = "Harpoon 2" },
      { "<leader>3", harpoon_select(3), desc = "Harpoon 3" },
      { "<leader>4", harpoon_select(4), desc = "Harpoon 4" },
      { "<leader>5", harpoon_select(5), desc = "Harpoon 5" },
    },
  },
}
