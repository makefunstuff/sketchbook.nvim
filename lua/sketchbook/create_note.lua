local M = {}

function M.create_new_note()
  local notes_dir = vim.g.notes_directory or "~/notes/"
  local filename = os.date "%Y-%m-%d_%H-%M-%S" .. ".md"
  local filepath = vim.fn.expand(notes_dir) .. filename
  local title = "Title " .. os.date "%Y-%m-%d %H:%M:%S"
  local template = {
    "# " .. title,
    "",
  }
  local file = io.open(filepath, "w")
  for _, line in ipairs(template) do
    file:write(line .. "\n")
  end
  file:close()
  vim.cmd("edit " .. filepath)
end

return M
