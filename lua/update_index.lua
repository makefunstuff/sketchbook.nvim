local M = {}

function M.update_index()
  local notes_dir = vim.g.notes_directory or "~/notes/"
  notes_dir = vim.fn.expand(notes_dir)
  local index_file = notes_dir .. "index.md"
  local notes = vim.fn.globpath(notes_dir, "*.md", false, true)
  local content = { "# Index", "" }
  for _, note in ipairs(notes) do
    if vim.fn.fnamemodify(note, ":t") ~= "index.md" then
      table.insert(content, "- [" .. vim.fn.fnamemodify(note, ":t:r") .. "](" .. note .. ")")
    end
  end
  local file = io.open(index_file, "w")
  for _, line in ipairs(content) do
    file:write(line .. "\n")
  end
  file:close()
  print "Index updated"
end

return M
