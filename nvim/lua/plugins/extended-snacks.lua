return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    explorer = { enabled = true },
    picker = {
      enabled = true,
      sources = {
        explorer = {
          enabled = true,
          hidden = true,
          auto_close = true,
          layout = { auto_hide = { "input" } },
          win = {
            list = {
              keys = {
                ["w"] = { { "pick_win", "jump" }, mode = { "n", "i" } },
                ["v"] = { "edit_vsplit", mode = { "i", "n" } },
                ["s"] = { "edit_split", mode = { "i", "n" } },
              },
            },
          },
        },
      },
    },
  },
}
