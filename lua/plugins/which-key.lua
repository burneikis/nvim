local function harpoon_select(index)
  return function()
    require("harpoon"):list():select(index)
  end
end

local function harpoon_desc(index)
  return function()
    local harpoon = require("harpoon")
    local item = harpoon:list():get(index)
    if item and item.value then
      return vim.fn.fnamemodify(item.value, ":t")
    end
    return "Harpoon " .. index
  end
end

return {
  {
    "folke/which-key.nvim",
    opts = {
      icons = {
        breadcrumb = "",
        separator = "",
        group = "",
      },
      spec = {
        {
          "<leader>H",
          function()
            local harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = "Harpoon quick menu",
          icon = "󰀱",
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
          icon = "",
        },
        { "<leader>1", harpoon_select(1), desc = harpoon_desc(1) },
        { "<leader>2", harpoon_select(2), desc = harpoon_desc(2) },
        { "<leader>3", harpoon_select(3), desc = harpoon_desc(3) },
        { "<leader>4", harpoon_select(4), desc = harpoon_desc(4) },
        { "<leader>5", harpoon_select(5), desc = harpoon_desc(5) },
      },
    },
  },
}
