-- author: thohnb
-- Options for Neovim (Global)
-- Kickstart Ref:
-- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
local global = vim.g
local options = vim.opt
vim.cmd.colorscheme('gruvbox-material')
-- set theme
options.number = true
options.showmode = false
-- Case
options.ignorecase = true
options.smartcase = true
-- split
options.splitbelow = true
-- Fillchar
options.fillchars = { eob = " " }
options.inccommand = 'split'
options.scrolloff = 10
-- popup whichkey sooner
-- Disable hlsearch
options.hlsearch = false
options.wrap = true
-- Gui
options.cmdheight = 0
options.showtabline = 3
options.laststatus = 3
-- Disable swapsize
options.swapfile = false

vim.opt.termguicolors = true
vim.opt.updatetime = 200
-- Disable Mouse
-- vim.opt.mouse = ''
vim.opt.mousescroll = "ver:0,hor:0"
vim.opt.mousemodel = 'extend'

local n = require("nui-components")

-- Create the renderer with specific dimensions


local n = require("nui-components")

-- Create the renderer with specific dimensions
local renderer = n.create_renderer({
  width = 60,
  height = 10,
})

-- Function to open a buffer selection UI
function open_buffer_list_ui()
    -- Get list of buffers
    local buffers = vim.api.nvim_list_bufs()
    local items = {}
    local current_buffer = vim.api.nvim_get_current_buf() -- Get the current buffer ID
    local cur_buffer_name = vim.api.nvim_buf_get_name(current_buffer) -- Get the name of the current buffer
    local cur_buffer_path = vim.fn.fnamemodify(cur_buffer_name, ":p") -- Full path of the current buffer

    -- Prepare buffer list for the UI
    for _, buf in ipairs(buffers) do
        if vim.api.nvim_buf_is_loaded(buf) then
            -- Get the buffer path
            local buf_path = vim.api.nvim_buf_get_name(buf)
            if buf_path ~= cur_buffer_path then
                -- Get the buffer name
                local buf_name = vim.fn.fnamemodify(buf_path, ":t")
                if buf_name ~= "" then
                    table.insert(items, n.node({ text = buf_path, bufnr = buf }))
                end
            end
        end
    end

    -- Check if items list is empty
    if #items == 0 then
        -- vim.notify("No buffers available", vim.log.levels.INFO)
        return
    end

    -- Create the buffer list UI tree
    local buffer_tree = n.tree({
        autofocus = true,
        border_label = "Buffer List",
        data = items,  -- Pass the dynamic buffer list
        -- Event for selecting a buffer
        on_select = function(node, component)
            -- Check if the buffer is already open in any window
            local buffer_found = false
            for _, win in ipairs(vim.api.nvim_list_wins()) do
                local buf = vim.api.nvim_win_get_buf(win)
                if buf == node.bufnr then
                    -- Switch to the window displaying the buffer
                    vim.api.nvim_set_current_win(win)
                    buffer_found = true
                    break
                end
            end
            
            component:unmount()
            -- If the buffer is not open in any window, open it in a new split
                vim.cmd("buffer " .. node.bufnr)
            -- Close the UI after selection
        end,
        -- Customize how each buffer is displayed in the UI
        prepare_node = function(node, line, component)
            local buf_path = node.text
            local folder_name = vim.fn.fnamemodify(vim.fn.fnamemodify(buf_path, ":p:h"), ":t")
            local file_name = vim.fn.fnamemodify(buf_path, ":t")
            local filetype = vim.fn.fnamemodify(file_name, ":e")  -- Extract the file extension as filetype
            
            -- Get the icon and highlight for the file type
            local icon, icon_highlight = require("nvim-web-devicons").get_icon_by_filetype(filetype, { default = true })
            -- Append the folder name as a comment
            line:append("[" .. folder_name .. "] ", "Comment")
        
            -- Append the file name\
            line:append(icon .. " ")
            line:append(file_name)
        
            return line
        end
        
    })

    -- Render the buffer list using the renderer
    renderer:render(buffer_tree)
end

-- Keybind to open buffer list UI
-- Keybind to open buffer list UI
vim.api.nvim_set_keymap('n', '<Tab>', ':lua open_buffer_list_ui()<CR>', { noremap = true, silent = true })

