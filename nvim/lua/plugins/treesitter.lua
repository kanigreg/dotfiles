return {
  "nvim-treesitter/nvim-treesitter",
  event = { "VeryLazy" },
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  keys = {
    { "<c-space>", desc = "Increment Selection" },
    { "<bs>", desc = "Decrement Selection", mode = "x" },
  },
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    endwise = {
      enable = true,
    },
    ensure_installed = {
      "lua",
      "luadoc",
      "vim",
      "vimdoc",
      "markdown",
      "markdown_inline",
      "diff",
      "query",
      "json",
      "jsonc",
      "yaml",
      "make",
      "ruby",
      "racket",
      "bash",
      "regex",
      "toml",
      "xml",
      "comment",
      "dockerfile",
      "sql",
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
    textobjects = {
      move = {
        enable = true,
        goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
        goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
        goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
        goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
      },
    },
    additional_vim_regex_highlighting = false,
  },
  config = function(_, opts)
    local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

    vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
    vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

    vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
    vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
    vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
    vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)

    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.d2 = {
      install_info = {
        url = "https://git.pleshevski.ru/pleshevskiy/tree-sitter-d2",
        revision = "main",
        files = { "src/parser.c", "src/scanner.c" },
      },
      filetype = "d2",
    }

    require("nvim-treesitter.configs").setup(opts)
  end,
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-context",
      enabled = true,
      opts = { mode = "cursor", max_lines = 3 },
    },
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    { "RRethy/nvim-treesitter-endwise" },
    { "nvim-treesitter/playground" },
    { "windwp/nvim-ts-autotag" },
  },
}
