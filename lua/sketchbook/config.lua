local M = {}

-- Default configuration
M.defaults = {
	notes_directory = "~/notes",
	keymaps = {
		create_note = "<leader>tnn",
		update_index = "<leader>tui",
		search_notes = "<leader>tns",
		list_notes = "<leader>tnl",
		toggle_quick_note = "<leader>qc",
		create_quick_note = "<leader>nq",
		open_entire_quick_note = "<leader>qo",
		commit_notes = "<leader>tgc",
		push_notes = "<leader>tgp",
	},
}

M.config = {}

function M.setup(user_config)
	M.config = vim.tbl_deep_extend("force", {}, M.defaults, user_config or {})
	vim.g.notes_directory = M.config.notes_directory
	vim.g.notes_templates_dir = M.config.templates_directory
	M.set_keymaps()
end

function M.set_keymaps()
	local keymaps = M.config.keymaps

	vim.api.nvim_set_keymap(
		"n",
		keymaps.create_note,
		':lua require("sketchbook.create_note").create_new_note()<CR>',
		{ noremap = true, silent = true, desc = "Create a new note" }
	)
	vim.api.nvim_set_keymap(
		"n",
		keymaps.update_index,
		':lua require("sketchbook.update_index").update_index()<CR>',
		{ noremap = true, silent = true, desc = "Update notes index" }
	)
	vim.api.nvim_set_keymap(
		"n",
		keymaps.search_notes,
		':lua require("sketchbook.search_notes").search_notes()<CR>',
		{ noremap = true, silent = true, desc = "Search notes" }
	)
	vim.api.nvim_set_keymap(
		"n",
		keymaps.create_quick_note,
		':lua require("sketchbook.quick_note").create_quick_note_window()<CR>',
		{ noremap = true, silent = true, desc = "Create a quick note buffer" }
	)
	vim.api.nvim_set_keymap(
		"n",
		keymaps.toggle_quick_note,
		':lua require("sketchbook.quick_note").toggle_quick_note_window()<CR>',
		{ noremap = true, silent = true, desc = "Toggle quick note window" }
	)
	vim.api.nvim_set_keymap(
		"n",
		keymaps.open_entire_quick_note,
		':lua require("sketchbook.quick_note").open_entire_quick_note()<CR>',
		{ noremap = true, silent = true, desc = "Open entire quick note" }
	)
	vim.api.nvim_set_keymap(
		"n",
		keymaps.commit_notes,
		':lua require("sketchbook.git_sync").commit_notes()<CR>',
		{ noremap = true, silent = true, desc = "Commit notes to Git" }
	)
	vim.api.nvim_set_keymap(
		"n",
		keymaps.push_notes,
		':lua require("sketchbook.git_sync").push_notes()<CR>',
		{ noremap = true, silent = true, desc = "Push notes to remote Git repository" }
	)
	vim.api.nvim_set_keymap(
		"n",
		keymaps.list_notes,
		':lua require("sketchbook.list_notes").list_all_notes()<CR>',
		{ noremap = true, silent = true, desc = "List all notes" }
	)
end

return M
