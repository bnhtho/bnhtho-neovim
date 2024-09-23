return {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons',
config = function()
    local bufferline = require("bufferline")
    require("bufferline").setup {
        options = {
          -- style_preset = bufferline.style_preset.minimal,
          color_icons = false,
          diagnostics = false,
          show_close_icon = false,
          show_buffer_close_icons = false,
          show_tab_indicators = false,
          close_icon = '',
          separator_style = {"",""},
          offsets = {
            {
              filetype = "neo-tree",
              text = "Tree Explorer",
              highlight = "Normal",
              separator = false,
              text_align = "left" -- use a "true" to enable the default, or set your own character
            }
          }
        }
      }
end
}