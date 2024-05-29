return {
  "lewis6991/gitsigns.nvim",
  opts = {
    trouble = true,
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "┆" },
    },
    on_attach = function(buffer)
      local gs = require("gitsigns")

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
      end

      -- Navigation
      map("n", "]h", function()
        gs.nav_hunk("next", { navigation_message = false, preview = true })
      end, "Next Hunk")
      map("n", "[h", function()
        gs.nav_hunk("prev", { navigation_message = false, preview = true })
      end, "Prev Hunk")
      map("n", "<leader>ghl", gs.setloclist, "Set Hunks to loclist")

      -- Stage, unstage
      map("n", "<leader>ghs", gs.stage_hunk, "Stage hunk")
      map("n", "<leader>ghr", gs.reset_hunk, "Reset hunk")
      map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
      map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
      map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")

      -- Preview
      map("n", "<leader>ghP", gs.preview_hunk, "Preview Hunk")
      map("n", "<leader>ghp", gs.preview_hunk_inline, "Preview Hunk Inline")

      -- Diffs
      map("n", "<leader>ghd", gs.diffthis, "Diff This")
      map("n", "<leader>ghD", function()
        gs.diffthis("~")
      end, "Diff This ~")

      -- Blame
      --
      map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")

      -- Selection
      --
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
    end,
  },
}
