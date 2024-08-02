local M = {}

function M.list_all_notes()
	local notes_dir = vim.g.notes_directory or "~/notes/"
	require("telescope.builtin").find_files({
		prompt_title = "Find Notes",
		cwd = notes_dir,
		hidden = true,
	})
end

return M
