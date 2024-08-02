local config = require "sketchbook.config"
local create_note = require "sketchbook.create_note"
local update_index = require "sketchbook.update_index"
local search_notes = require "sketchbook.search_notes"
local select_template = require "sketchbook.select_template"
local quick_note = require "sketchbook.quick_note"
local git_support = require "sketchbook.git_sync"

local M = {}

function M.setup(user_config)
  config.setup(user_config)
end

return M
