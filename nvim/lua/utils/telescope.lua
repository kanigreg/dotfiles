local builtin = require("telescope.builtin")
local previewers = require("telescope.previewers")

local M = {}

M.git_commits_delta = function(opts)
  opts = opts or {}
  opts.previewer = previewers.new_termopen_previewer({
    title = "Git Delta Previewer",
    get_command = function(entry)
      return { "git", "-c", "core.pager=delta", "-c", "delta.side-by-side=false", "diff", entry.value .. "^!" }
    end,
  })

  builtin.git_commits(opts)
end

M.git_bcommits_delta = function(opts)
  opts = opts or {}
  opts.previewer = previewers.new_termopen_previewer({
    title = "Git Delta Previewer",
    get_command = function(entry)
      return {
        "git",
        "-c",
        "core.pager=delta",
        "-c",
        "delta.side-by-side=false",
        "diff",
        entry.value .. "^!",
        "--",
        entry.current_file,
      }
    end,
  })

  builtin.git_bcommits(opts)
end

M.git_status_delta = function(opts)
  opts = opts or {}
  opts.previewer = previewers.new_termopen_previewer({
    title = "Git Delta Previewer",
    get_command = function(entry)
      return { "git", "-c", "core.pager=delta", "-c", "delta.side-by-side=false", "diff", entry.value }
    end,
  })

  builtin.git_status(opts)
end

return M
