local yandex_ai_adapter = require("plugins.codecompanion.yandex_ai_adapter")

return {
  "olimorris/codecompanion.nvim",
  cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions" },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    strategies = {
      chat = {
        adapter = "yandex_ai",
      },
      inline = {
        adapter = "yandex_ai",
      },
    },
    adapters = {
      http = {
        opts = {
          show_defaults = false,
          show_model_choices = true,
        },
        yandex_ai = yandex_ai_adapter,
      },
    },
  },
}
