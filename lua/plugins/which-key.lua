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
        { "<leader>H", desc = "Harpoon quick menu", icon = "󰀱" },
        { "<leader>a", desc = "Add file to Harpoon", icon = "" },
        { "<leader>1", desc = harpoon_desc(1) },
        { "<leader>2", desc = harpoon_desc(2) },
        { "<leader>3", desc = harpoon_desc(3) },
        { "<leader>4", desc = harpoon_desc(4) },
        { "<leader>5", desc = harpoon_desc(5) },
        { "<leader>y", group = "Yank", icon = "" },
        { "<leader>yp", desc = "Yank relative path", icon = "" },
        { "<leader>yP", desc = "Yank full path", icon = "" },
      },
    },
  },
}
