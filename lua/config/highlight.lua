-- author: thohnb
-- Highlight theme
-- //SECTION: Highlight
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

vim.cmd([[
              highlight! link NeoTreeNormal Normal
              highlight! link NeoTreeEndOfBuffer Normal
]])
-- //SECTION: Winbar
vim.api.nvim_set_hl(0, 'TabLine', { bg = 'NONE', fg = 'NONE' })
vim.api.nvim_set_hl(0, 'TabLineFill', { bg = 'NONE', fg = 'NONE' })
vim.api.nvim_set_hl(0, 'TabLineSel', { bg = 'NONE', fg = 'NONE' })
-- vim.api.nvim_set_hl(0, 'TabLineActive', { underline = true })
vim.api.nvim_set_hl(0, 'TabLineInactive', { bg = 'NONE', fg = 'darkgray' })

--// SECTION: Status Bar
vim.api.nvim_set_hl(0, 'ModeMsg', { bg = 'NONE', fg = 'NONE' })
vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'NONE', fg = 'NONE' })
vim.api.nvim_set_hl(0, 'NeoTreeWinSeparator', { fg = "#292828" })
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = "#292828" })
vim.api.nvim_set_hl(0, 'WinBar', { bg = "NONE" })
vim.api.nvim_set_hl(0, 'NormalNC', { bg = "NONE" })
vim.api.nvim_set_hl(0, 'WinBarNC', { bg = "NONE" })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = "#292828" })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'NONE' })

-- -- Mini.Tab
vim.api.nvim_set_hl(0, 'MiniTablineFill', { bg = '#292828' })
vim.api.nvim_set_hl(0, 'MiniTablineCurrent', { bg = '#292828', fg = '#80AA9E' })         -- Active buffer
vim.api.nvim_set_hl(0, 'MiniTablineVisible', { bg = '#292828', fg = 'NONE' })            -- Visible buffer
vim.api.nvim_set_hl(0, 'MiniTablineHidden', { bg = '#292828', fg = '#a0a0a0' })          -- Inactive buffer (gray)
vim.api.nvim_set_hl(0, 'MiniTablineModifiedCurrent', { bg = '#292828', fg = '#D2A655' }) -- Active modified buffer
vim.api.nvim_set_hl(0, 'MiniTablineModifiedVisible', { bg = '#292828', fg = '#D2A655' }) -- Visible modified buffer
vim.api.nvim_set_hl(0, 'MiniTablineModifiedHidden', { bg = '#292828', fg = '#a0a0a0' })  -- Unfocus modified buffer
vim.api.nvim_set_hl(0, 'MiniTablineFill', { bg = '#292828' })                            -- Fill area
vim.api.nvim_set_hl(0, 'MiniTablineTabpagesection', { bg = '#292828', fg = '#ffffff' })  -- Tabpage section
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'NONE', fg = '#a0a0a0' })

-- NOTE: Incline
vim.api.nvim_set_hl(0, 'InclineNormal', { bg = 'NONE', fg = '#80AA9E' })

