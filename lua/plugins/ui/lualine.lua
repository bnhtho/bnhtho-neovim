local transparent_theme = require('config.functions')
return {
    'nvim-lualine/lualine.nvim',
    dependencies = {{'nvim-tree/nvim-web-devicons'},{"christopher-francisco/tmux-status.nvim",
    lazy = true,
    opts = {},
}},
    opts = {
        options = {
            disabled_filetypes = {
                -- hide no name
                statusline = {"","alpha"},
              },
            theme = transparent_theme.theme(),
            
        },
        sections = {
            lualine_a = {"mode",
        },
            lualine_b = {},
            lualine_c = {''},
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