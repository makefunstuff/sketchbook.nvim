local M = {}
local floating_win = nil

local function get_win_config()
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)
  return {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  }
end

function M.create_quick_note_window()
  if floating_win and vim.api.nvim_win_is_valid(floating_win) then
    vim.api.nvim_set_current_win(floating_win)
    return
  end

  local buf = vim.api.nvim_create_buf(false, true)
  floating_win = vim.api.nvim_open_win(buf, true, get_win_config())

  vim.api.nvim_buf_set_option(buf, "buftype", "acwrite")
  vim.api.nvim_buf_set_name(buf, "QuickNote")
end

function M.toggle_quick_note_window()
  if floating_win and vim.api.nvim_win_is_valid(floating_win) then
    M.close_quick_note_window()
  else
    M.create_quick_note_window()
  end
end

function M.close_quick_note_window()
  if floating_win and vim.api.nvim_win_is_valid(floating_win) then
    local buf = vim.api.nvim_win_get_buf(floating_win)
    M.prepend_to_quick_note()
    vim.api.nvim_win_close(floating_win, true)
    vim.api.nvim_buf_delete(buf, { force = true })
  end
end

function M.prepend_to_quick_note()
  local notes_dir = vim.g.notes_directory or "~/notes/"
  local filepath = vim.fn.expand(notes_dir) .. "/quick_note.md"
  local buf = vim.api.nvim_win_get_buf(floating_win)
  local content = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

  -- Add a separator and timestamp before the new content
  local separator = "------------------------"
  local timestamp = os.date "%Y-%m-%d %H:%M:%S"
  table.insert(content, 1, "")
  table.insert(content, 1, separator)
  table.insert(content, 1, timestamp)
  table.insert(content, 1, separator)
  table.insert(content, 1, "")

  -- Check if quick_note.md exists, create it if it doesn't
  if vim.fn.filereadable(filepath) == 0 then
    vim.fn.writefile({}, filepath)
  end

  local file_content = vim.fn.readfile(filepath)
  for i = #file_content, 1, -1 do
    table.insert(content, 1, file_content[i])
  end

  vim.fn.writefile(content, filepath)
  print "Prepended content to quick_note.md"
end

function M.open_entire_quick_note()
  local notes_dir = vim.g.notes_directory or "~/notes/"
  local filepath = vim.fn.expand(notes_dir) .. "/quick_note.md"

  if vim.fn.filereadable(filepath) == 0 then
    print "No quick_note.md file found."
    return
  end

  vim.cmd("edit " .. filepath)
end

return M
