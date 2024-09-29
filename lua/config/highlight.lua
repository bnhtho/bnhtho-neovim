-- author: thohnb
-- Highlight theme
-- //SECTION: Highlight
-- NOTE:
-- //SECTION: nvim-autocmp
local highlight = vim.api.nvim_set_hl
highlight(0, 'CmpItemAbbrDeprecated', { bg = 'NONE', strikethrough = true, fg = '#808080' })
highlight(0, 'CmpItemAbbrMatch', { bg = 'NONE', fg = '#569CD6' })
highlight(0, 'CmpItemAbbrMatchFuzzy', { link = 'CmpIntemAbbrMatch' })
highlight(0, 'CmpItemKindVariable', { bg = 'NONE', fg = '#9CDCFE' })
highlight(0, 'CmpItemKindInterface', { link = 'CmpItemKindVariable' })
highlight(0, 'CmpItemKindText', { link = 'CmpItemKindVariable' })
highlight(0, 'CmpItemKindFunction', { bg = 'NONE', fg = '#C586C0' })
highlight(0, 'CmpItemKindMethod', { link = 'CmpItemKindFunction' })
highlight(0, 'CmpItemKindKeyword', { bg = 'NONE', fg = '#D4D4D4' })
highlight(0, 'CmpItemKindProperty', { link = 'CmpItemKindKeyword' })
highlight(0, 'CmpItemKindUnit', { link = 'CmpItemKindKeyword' })

vim.cmd([[
              highlight! link NeoTreeNormal Normal
              highlight! link NeoTreeEndOfBuffer Normal
]])
-- //SECTION: Winbar
highlight(0, 'TabLine', { bg = 'NONE', fg = 'NONE' })
highlight(0, 'TabLineFill', { bg = 'NONE', fg = 'NONE' })
highlight(0, 'TabLineSel', { bg = 'NONE', fg = 'NONE' })
-- highlight(0, 'TabLineActive', { underline = true })
highlight(0, 'TabLineInactive', { bg = 'NONE', fg = 'darkgray' })

--// SECTION: Status Bar
highlight(0, 'ModeMsg', { bg = 'NONE', fg = 'NONE' })
highlight(0, 'StatusLine', { bg = 'NONE', fg = 'NONE' })
highlight(0, 'NeoTreeWinSeparator', { fg = "#292828" })
highlight(0, 'WinSeparator', { fg = "#292828" })
highlight(0, 'WinBar', { bg = "NONE" })
highlight(0, 'NormalNC', { bg = "NONE" })
highlight(0, 'WinBarNC', { bg = "NONE" })
-- highlight(0, 'NormalFloat', { bg = "#292828" })
highlight(0, 'FloatBorder', { bg = 'NONE' })
highlight(0, 'NormalFloat', { bg = 'NONE' })
-- NOTE: Incline
highlight(0, 'InclineNormal', { bg = 'NONE', fg = '#80AA9E' })
-- NOTE: Highlight hlnes
highlight(0, 'HlSearchLens', { fg = 'darkgray' })
highlight(0, 'HlSearchLensNear', { fg = 'darkgray' })
-- vim.api.nvim_set_hl(0, 'MiniJump2dSpot', { sp = 'Red', undercurl = true })


-- //NOTE: Flash
highlight(0, 'FlashLabel', { bg = 'NONE', fg= '#D89639',underline = false})

--