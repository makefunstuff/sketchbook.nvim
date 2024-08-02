local config = require("sketchbook.config")

local M = {}

function M.setup(user_config)
	config.setup(user_config)
end

M.setup()

return M
