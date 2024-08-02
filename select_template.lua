local M = {}

local templates_dir = vim.g.notes_templates_dir or "~/notes/templates/"

function M.select_template()
  templates_dir = vim.fn.expand(templates_dir)
  local templates = vim.fn.readdir(templates_dir, function(name)
    return name:match "%.md$"
  end)

  if vim.tbl_isempty(templates) then
    M.create_note_from_template(nil)
  else
    local template_files = {}
    for _, template in ipairs(templates) do
      table.insert(template_files, templates_dir .. template)
    end

    require("telescope.pickers")
      .new({}, {
        prompt_title = "Select Template",
        finder = require("telescope.finders").new_table {
          results = template_files,
          entry_maker = function(entry)
            return {
              value = entry,
              display = vim.fn.fnamemodify(entry, ":t"),
              ordinal = entry,
            }
          end,
        },
        sorter = require("telescope.config").values.generic_sorter {},
        attach_mappings = function(prompt_bufnr, map)
          local actions = require "telescope.actions"
          local action_state = require "telescope.actions.state"

          actions.select_default:replace(function()
            actions.close(prompt_bufnr)
            local selection = action_state.get_selected_entry()
            M.create_note_from_template(selection.value)
          end)

          return true
        end,
      })
      :find()
  end
end

function M.create_note_from_template(template_path)
  local notes_dir = vim.g.notes_directory or "~/notes/"
  local filename = os.date "%Y-%m-%d_%H-%M-%S" .. ".md"
  local filepath = vim.fn.expand(notes_dir) .. filename
  vim.cmd("edit " .. filepath)
  if template_path then
    vim.cmd("0r " .. template_path)
  else
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
  end
end

return M
