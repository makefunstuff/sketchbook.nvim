local M = {}

function M.is_git_repo(path)
  local git_dir = vim.fn.systemlist("git -C " .. path .. " rev-parse --is-inside-work-tree")[1]
  return git_dir == "true"
end

function M.commit_notes()
  local notes_dir = vim.g.notes_directory or "~/notes/"
  notes_dir = vim.fn.expand(notes_dir)

  if not M.is_git_repo(notes_dir) then
    vim.notify("Note folder is not a Git repository.", vim.log.levels.WARN)
    return
  end

  local commit_message = "Update notes: " .. os.date "%Y-%m-%d %H:%M:%S"
  vim.fn.system("git -C " .. notes_dir .. " add .")
  vim.fn.system("git -C " .. notes_dir .. " commit -m '" .. commit_message .. "'")
  vim.notify("Notes committed to Git repository.", vim.log.levels.INFO)
end

function M.push_notes()
  local notes_dir = vim.g.notes_directory or "~/notes/"
  notes_dir = vim.fn.expand(notes_dir)

  if not M.is_git_repo(notes_dir) then
    vim.notify("Note folder is not a Git repository.", vim.log.levels.WARN)
    return
  end

  vim.fn.system("git -C " .. notes_dir .. " push")
  vim.notify("Notes pushed to remote repository.", vim.log.levels.INFO)
end

return M
