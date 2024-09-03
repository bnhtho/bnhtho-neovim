return {
    "rebelot/heirline.nvim",
    dependencies = {"christopher-francisco/tmux-status.nvim"},
    config = function()
        local heirline = require("heirline")
        local tmux_status = require("tmux-status")

        -- Define your StatusLine component
        local StatusLine = {
            -- Add your custom statusline components here
            -- asd
        }

        -- Define your WinBar component
        local WinBar = {
            -- Add your custom winbar components here
        }

        -- Define your TabLine component
        local TabLine = {
            -- Add your custom tabline components here
        }

        -- Define your StatusColumn component
        local StatusColumn = {
            -- Add your custom statuscolumn components here
        }

        -- Setup heirline with the defined components
        heirline.setup({
            statusline = StatusLine,
            winbar = WinBar,
            tabline = TabLine,
            statuscolumn = StatusColumn,
            opts = {
                -- Add other configuration parameters here if needed
            },
        })
    end
}
