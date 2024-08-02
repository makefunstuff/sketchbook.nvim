local M = {}

function M.search_notes()
  local notes_dir = vim.g.notes_directory or "~/notes/"
  require("telescope.builtin").live_grep {
    search_dirs = { vim.fn.expand(notes_dir) },
  }
end

return M
