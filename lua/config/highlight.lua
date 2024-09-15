-- author: thohnb
-- Highlight theme
-- //SECTION: Highlight
if (vim.g.colors_name == 'gruvbox-material') then
-- //SECTION: nvim-autocmp
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg = 'NONE', strikethrough = true, fg = '#808080' })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg = 'NONE', fg = '#569CD6' })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link = 'CmpIntemAbbrMatch' })
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg = 'NONE', fg = '#9CDCFE' })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link = 'CmpItemKindVariable' })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { link = 'CmpItemKindVariable' })
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg = 'NONE', fg = '#C586C0' })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link = 'CmpItemKindFunction' })
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg = 'NONE', fg = '#D4D4D4' })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link = 'CmpItemKindKeyword' })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link = 'CmpItemKindKeyword' })

-- Neotree : normal color
-- Ref:https://github.com/sainnhe/gruvbox-material/issues/182
vim.cmd([[
              highlight! link NeoTreeNormal Normal
              highlight! link NeoTreeEndOfBuffer Normal
]])
-- //SECTION: Winbar
vim.api.nvim_set_hl(0, 'TabLine', { bg = 'NONE', fg = 'NONE' })
vim.api.nvim_set_hl(0, 'TabLineFill', { bg = 'NONE', fg = 'NONE' })
vim.api.nvim_set_hl(0, 'TabLineSel', { bg = 'NONE', fg = 'NONE' })
vim.api.nvim_set_hl(0, 'TabLineActive', { underline = true })
vim.api.nvim_set_hl(0, 'TabLineInactive', { bg = 'NONE', fg = 'darkgray' })

--// SECTION: Status Bar
vim.api.nvim_set_hl(0, 'ModeMsg', { bg = 'NONE', fg = 'NONE' })
vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'NONE', fg = 'NONE' })
-- // SECTION: Snap Plugin
vim.api.nvim_set_hl(0, 'SnapPrompt', { bg = 'NONE', fg = 'NONE' })
-- vim.api.nvim_set_hl(0, 'SnapSelect', { bg = 'NONE', fg = 'NONE' })
vim.api.nvim_set_hl(0, 'SnapBorder', { bg = 'NONE', fg = 'NONE' })

-- // SECTION: Neotree Winseperator
-- vim.api.nvim_set_hl(0, 'WinSeparator', { bg = 'NONE', fg = 'NONE' })
-- vim.api.nvim_set_hl(0, 'NeoTreeWinSeparator', {bg = '#404040' })
vim.api.nvim_set_hl(0, 'NeoTreeWinSeparator', { fg = "#292828" })
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = "#292828" })
vim.api.nvim_set_hl(0, 'EdgyIcon', { fg = "#292828" })
vim.api.nvim_set_hl(0, 'EdgyIconActive', { fg = "#292828" })
-- vim.api.nvim_set_hl(0, '', { bg= "red",fg = "#292828" })
vim.api.nvim_set_hl(0, 'EdgyTitle', { bg = "#292828"})
vim.api.nvim_set_hl(0, 'FloatTitle', { bg = "#292828"})
vim.api.nvim_set_hl(0, 'EdgyWinBar', { bg = "#292828"})
vim.api.nvim_set_hl(0, 'WinBar', { bg = "#292828"})
vim.api.nvim_set_hl(0, 'WinBarNC', { bg = "#292828"})
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = "#292828"})

end
