--- author: thohnb
-- modules: contains all function
local M = {}


local function str_length(s)
	return string.len(s)
end

local function toggle_comment(highlight)
	print(highlight)

	-- Get the current cursor position
	local cursor_pos = vim.api.nvim_win_get_cursor(0)
	local line_number = cursor_pos[1]
	local col_number = cursor_pos[2]

	-- Get the current line
	local line = vim.api.nvim_get_current_line()

	-- Check if the highlight exists in the line
	local highlight_start = line:find(highlight, col_number + 1) -- Find highlight starting from cursor position
	if highlight_start then
		-- Highlight exists, remove it
		local new_line = line:sub(1, highlight_start - 1) .. line:sub(highlight_start + str_length(highlight))
		vim.api.nvim_set_current_line(new_line)

		-- Move cursor back to the position before the highlight
		vim.api.nvim_win_set_cursor(0, { line_number, highlight_start - 1 })
	else
		-- Highlight does not exist, add it
		local new_line = line:sub(1, col_number) .. highlight
		vim.api.nvim_set_current_line(new_line)
		-- Comment that new_line
		require('Comment.api').toggle.linewise.current(new_line)
		-- Move cursor to the position after the inserted highlight :
		vim.api.nvim_win_set_cursor(0,
			{ line_number, col_number + str_length(highlight) + str_length(highlight) })
		-- vim.cmd('normal! ^[o')
	end
end

function M.pick_todo()
	vim.ui.select({ 'TODO', 'FIXME', 'WARN', 'TEST', 'NOTE' }, {
			prompt = "Select a highlight type",
		},
		function(selected)
			if selected then
				toggle_comment(selected)
				-- vim.api.nvim_feedkeys("<Space>", "n", false)
				vim.api.nvim_feedkeys("a : ", "n", false)
			end
		end)
end

return M
