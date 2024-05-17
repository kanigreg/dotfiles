return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    presets = {
      command_palette = true,
      bottom_search = true,
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  keys = {
    {
      "<leader>snl",
      function()
        require("noice").cmd("last")
      end,
      desc = "Noice Last Message",
    },
    {
      "<leader>snh",
      function()
        require("noice").cmd("telescope")
      end,
      desc = "Noice History",
    },
    {
      "<leader>sna",
      function()
        require("noice").cmd("all")
      end,
      desc = "Noice All",
    },
    {
      "<leader>snd",
      function()
        require("noice").cmd("dismiss")
      end,
      desc = "Dismiss All",
    },
  },
}
