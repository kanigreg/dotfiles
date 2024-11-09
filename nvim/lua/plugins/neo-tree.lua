return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({ toggle = true, source = "last" })
      end,
      desc = "Explorer NeoTree",
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
        ["Y"] = {
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg("+", path, "c")
          end,
          desc = "Copy Path to Clipboard",
        },
      },
      auto_expand_width = true,
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
    default_component_configs = {
      indent = {
        with_expanders = true,
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
      file_size = { enabled = false },
      last_modified = { enabled = false },
      created = { enabled = false },
      type = { enabled = false },
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
