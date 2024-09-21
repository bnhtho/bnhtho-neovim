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

function M.pick_todo()
    vim.ui.select({'apple', 'banana', 'mango'}, {
        prompt = "Title",
        -- telescope = require("telescope.themes").get_cursor(),
      }, 
      function(selected)
        print(selected)
    end)
    
end
return M