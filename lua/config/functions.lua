--- author: thohnb
-- modules: contains all function
--------------------------------------------------------------------------------
-- Function picker file
----------------------
local M = {}

-- Your existing function
function M.pick_buffer_and_split(split_cmd)
    vim.cmd(split_cmd .. " | ene")  -- Perform split and create an empty buffer in the new window

    vim.cmd("Pick buffers")  -- Open the buffer picker
    local picked_buf = vim.fn.bufnr('%')  -- Get the buffer number of the picked buffer

    -- Check if a valid buffer was picked
    if picked_buf > 0 then
        vim.cmd(":b " .. picked_buf)  -- Switch to the picked buffer in the new split
    else
        print("No buffer chosen, keeping empty buffer.")
    end
end


local function str_length(s)
    return string.len(s)
end

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
        local new_line = line:sub(1, col_number) .. highlight .. ' ' .. line:sub(col_number + 2) .. ''
        vim.api.nvim_set_current_line(new_line)
        -- Comment that new_line
        require('Comment.api').toggle.linewise.current(new_line)
        -- Move cursor to the position after the inserted highlight :
        vim.api.nvim_win_set_cursor(0, { line_number, col_number + str_length(highlight) + str_length(highlight) })
    end
end 

function M.pick_todo()
    vim.ui.select({'TODO', 'FIXME'}, {
        prompt = "Select a highlight type",
    }, 
    function(selected)
        if selected then
            toggle_comment(selected)
        end
    end)
end
return M