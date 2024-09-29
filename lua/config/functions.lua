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
        css = { comment_start = "/*" , comment_end = "*/" },
        -- Add more filetypes and comment formats here
    }

    -- Return the comment format for the current filetype, or a default format if not found
    return comment_formats[filetype] or { comment_start = "// ", comment_end = "" }
end

local function toggle_comment(highlight)
    -- Get the current cursor position
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    local line_number = cursor_pos[1]

    -- Get the current line
    local line = vim.api.nvim_get_current_line()

    -- Get the dynamic comment format based on filetype
    local comment_format = get_comment_format()
    local comment_start = comment_format.comment_start .. highlight .. ": "
    local comment_end = comment_format.comment_end

    -- Pattern to match existing comments
    local comment_pattern = vim.pesc(comment_format.comment_start) .. "(%w+): (.*)" .. vim.pesc(comment_end)

    -- Check if the line already contains a comment
    local existing_comment = line:match(comment_pattern)
    if existing_comment then
        -- Extract the inner text and the existing highlight
        local current_highlight, inner_text = line:match(comment_pattern)
        
        -- Create the new line with the new highlight and the preserved inner text
        local new_line = comment_start .. inner_text .. comment_end
        vim.api.nvim_set_current_line(new_line)

        -- Move cursor to the end of the new comment
        vim.api.nvim_win_set_cursor(0, { line_number, #comment_start + #inner_text + 2 }) -- +2 for ": "
    else
        -- Add the comment around the current text
        local new_line = comment_start .. line .. comment_end
        vim.api.nvim_set_current_line(new_line)

        -- If the line was empty, place the cursor after the comment start
        if line == "" then
            vim.api.nvim_win_set_cursor(0, { line_number, #comment_start })
        end
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


-- Make lualine transparent
M.theme = function()
    local colors = {
        material_transparent = "#292828",
        darkgray = "#fffff",
        gray = "#fffff",
        innerbg = nil,
        outerbg = "#16161D",
        normal = "#7e9cd8",
        insert = "#98bb6c",
        visual = "#ffa066",
        replace = "#e46876",
        command = "#e6c384",
    }
    return {
        inactive = {
            a = { fg = colors.gray, bg = colors.material_transparent, gui = "bold" },
            b = { fg = colors.gray, bg = colors.material_transparent },
            c = { fg = colors.gray, bg = colors.material_transparent },
        },
        visual = {
            a = { fg = colors.visual, bg = colors.material_transparent, gui = "bold" },
            b = { fg = colors.darkgray, bg = colors.material_transparent },
            c = { fg = colors.darkgray, bg = colors.material_transparent },
        },
        replace = {
            a = { fg = colors.replace, bg = colors.material_transparent, gui = "bold" },
            b = { fg = colors.darkgray, bg = colors.material_transparent },
            c = { fg = colors.darkgray, bg = colors.material_transparent },
        },
        normal = {
            a = { fg = colors.normal, bg = colors.material_transparent, gui = "bold" },
            b = { fg = colors.darkgray, bg = colors.material_transparent },
            c = { fg = colors.darkgray, bg = colors.material_transparent },
        },
        insert = {
            a = { fg = colors.insert, bg = colors.material_transparent, gui = "bold" },
            b = { fg = colors.darkgray, bg = colors.material_transparent },
            c = { fg = colors.darkgray, bg = colors.material_transparent },
        },
        command = {
            a = { fg = colors.command, bg = colors.material_transparent, gui = "bold" },
            b = { fg = colors.darkgray, bg = colors.material_transparent },
            c = { fg = colors.darkgray, bg = colors.material_transparent },
        },
    }
end
-- end
return M
