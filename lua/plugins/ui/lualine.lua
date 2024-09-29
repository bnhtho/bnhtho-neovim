local transparent_theme = require("config.utils")
return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        {"nvim-tree/nvim-web-devicons"},
        {
            "christopher-francisco/tmux-status.nvim",
            lazy = true,
            opts = {}
        },
        {"numToStr/Navigator.nvim", opts = {}}
    },
    opts = {
        options = {
            disabled_filetypes = {
                statusline = {"", "alpha"}
            },
            theme = transparent_theme.theme()
        },
        sections = {
            lualine_a = {
                "mode"
            },
            lualine_b = {},
            lualine_c = {""},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {}
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {}
        },
        extensions = {"neo-tree"}
    }
}
