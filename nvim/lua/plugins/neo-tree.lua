return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({ toggle = true })
      end,
      desc = "Explorer NeoTree",
    },
    {
      "<leader>ge",
      function()
        require("neo-tree.command").execute({ source = "git_status", toggle = true })
      end,
      desc = "Git Explorer",
    },
    {
      ",e",
      function()
        require("neo-tree.command").execute({ source = "gh", toggle = true })
      end,
      desc = "Example",
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "kanigreg/neo-tree-gh",
  },
  opts = {
    sources = { "filesystem", "git_status", "gh" },
    source_selector = {
      sources = {
        { source = "filesystem" },
        { source = "git_status" },
        { source = "gh" },
      },
    },
    window = {
      mappings = {
        ["<space>"] = "none",
      },
    },
    filesystem = {
      follow_current_file = { enabled = true },
      filtered_items = {
        hide_dotfiles = false,
        hide_by_name = {
          ".git",
          "node_modules",
          "vendor",
          ".vscode",
        },
      },
      use_libuv_file_watcher = true,
    },
    gh = {
      renderers = {},
      window = {
        mappings = {},
      },
    },
    default_component_configs = {
      indent = {
        with_expanders = true,
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
    },
    event_handlers = {
      {
        event = "file_opened",
        handler = function()
          require("neo-tree.command").execute({ action = "close" })
        end,
      },
    },
  },
}
