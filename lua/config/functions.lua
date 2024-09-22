--- author: thohnb
-- modules: contains all function
local M = {}


local function str_length(s)
	return string.len(s)
end

local function get_comment_format()
    -- Get the current filetype
    local filetype = vim.bo.filetype

    -- Define comment formats for different filetypes
    local comment_formats = {
        lua = { comment_start = "-- ", comment_end = "" },
        javascript = { comment_start = "// ", comment_end = "" },
        html = { comment_start = "<!-- ", comment_end = " -->" },
        markdown = { comment_start = "<!-- ", comment_end = " -->" },
        python = { comment_start = "# ", comment_end = "" },
        c = { comment_start = "/* ", comment_end = " */" },
        cpp = { comment_start = "// ", comment_end = "" },
        vim = { comment_start = "\" ", comment_end = "" },
        -- Add more filetypes and comment formats here
    }

    -- Return the comment format for the current filetype, or a default format if not found
    return comment_formats[filetype] or { comment_start = "// ", comment_end = "" }
end

local function toggle_comment(highlight)
    print(highlight)

    -- Get the current cursor position
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    local line_number = cursor_pos[1]

    -- Get the current line
    local line = vim.api.nvim_get_current_line()

    -- Get the dynamic comment format based on filetype
    local comment_format = get_comment_format()
    local comment_start = comment_format.comment_start .. highlight .. ": "
    local comment_end = comment_format.comment_end

    -- Check if the line already contains the highlight in the comment format
    local highlight_start = line:find(comment_start)
    if highlight_start then
        -- Highlight exists, remove the entire comment
        local new_line = line:gsub(comment_start .. "(.-)" .. comment_end, "%1", 1) -- Keep only the text inside the comment
        vim.api.nvim_set_current_line(new_line)

        -- Move cursor back to the position before the highlight
        vim.api.nvim_win_set_cursor(0, { line_number, highlight_start - 1 })
    else
        -- Highlight does not exist, add the comment around the current text
        local new_line = comment_start .. line .. comment_end
        vim.api.nvim_set_current_line(new_line)

        -- Move cursor to the position after the inserted highlight
        vim.api.nvim_win_set_cursor(0, { line_number, #new_line })
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
				-- vim.api.nvim_feedkeys("a ", "n", false)
			end
		end)
end

return M
