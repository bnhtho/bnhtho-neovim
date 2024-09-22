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
-- Pick todo-hightlight
-- Utility function to toggle comment
-- Function to toggle comment using Comment.nvim
local function toggle_comment(line_number)
    -- Use Comment.nvim's API to toggle comment for the current line
    require('Comment.api').toggle.linewise.current(line_number)
end

function M.pick_todo()
    vim.ui.select({'TODO', 'FIXME'}, {
        prompt = "Select a highlight type",
    }, 
    function(selected)
        if selected then
            -- Get the current cursor position
            local cursor_pos = vim.api.nvim_win_get_cursor(0) 
            local line_number = cursor_pos[1]
            local col_number = cursor_pos[2]

            -- Insert the selected text at the cursor position
            vim.api.nvim_buf_set_text(0, line_number - 1, col_number, line_number - 1, col_number, {selected})

            -- Toggle comment using Comment.nvim
            toggle_comment(line_number)
        else
            print("No selection made")
        end
    end)
end



return M