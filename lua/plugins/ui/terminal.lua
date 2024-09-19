return {'akinsho/toggleterm.nvim', version = "*", 
opts = {
    autochdir = true,
    shade_terminals = false,
    hide_numbers = true,
    shading_factor = '1',
    start_in_insert = true,
    highlights = {
        -- highlights which map to a highlight group name and a table of it's values
        -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
        Normal = {
          guibg = "#292828",
        },
        NormalFloat = {
          link = 'Normal'
        },
        
      },
    -- Open keybind
    -- open_mapping = [[<c-t>]],
    on_open = function(_)
        local manager = require("neo-tree.sources.manager")
        local renderer = require("neo-tree.ui.renderer")
        local state = manager.get_state("filesystem")
        local neotree_open = renderer.window_exists(state)
        if neotree_open == true then
        local name = vim.fn.bufname("neo-tree")
        local winnr = vim.fn.bufwinnr(name)
    
        if winnr ~= -1 then
          vim.defer_fn(function()
            local cmd = string.format("Neotree toggle")
            vim.cmd(cmd)
            vim.cmd(cmd)
            vim.cmd("wincmd p")
          end, 100)
        end
      end
    end
}}