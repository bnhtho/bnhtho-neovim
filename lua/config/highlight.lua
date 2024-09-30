-- ╔═══════════════════════╗
-- ║    Highlights         ║
-- ╚═══════════════════════╝
-- Code Completetion
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

-- ╔═══════════════════════╗
-- ║    UI                 ║
-- ╚═══════════════════════╝
highlight(0, 'ModeMsg', { bg = 'NONE', fg = 'NONE' })
highlight(0, 'StatusLine', { bg = 'NONE', fg = 'NONE' })
highlight(0, 'WinSeparator', { fg = "#292828" })
highlight(0, 'WinBar', { bg = "NONE" })
highlight(0, 'NormalNC', { bg = "NONE" })
highlight(0, 'WinBarNC', { bg = "NONE" })
highlight(0, 'FloatBorder', { bg = 'NONE' })
highlight(0, 'NormalFloat', { bg = 'NONE' })
-- ╔═══════════════════════╗
-- ║    Tabline            ║
-- ╚═══════════════════════╝
vim.api.nvim_set_hl(0, 'MiniTablineFill', { bg = '#292828' })
vim.api.nvim_set_hl(0, 'MiniTablineCurrent', { bg = '#292828', fg = '#80AA9E' })         -- Active buffer
vim.api.nvim_set_hl(0, 'MiniTablineVisible', { bg = '#292828', fg = 'NONE' })            -- Visible buffer
vim.api.nvim_set_hl(0, 'MiniTablineHidden', { bg = '#292828', fg = '#a0a0a0' })          -- Inactive buffer (gray)
vim.api.nvim_set_hl(0, 'MiniTablineModifiedCurrent', { bg = '#292828', fg = '#D2A655' }) -- Active modified buffer
vim.api.nvim_set_hl(0, 'MiniTablineModifiedVisible', { bg = '#292828', fg = '#D2A655' }) -- Visible modified buffer
vim.api.nvim_set_hl(0, 'MiniTablineModifiedHidden', { bg = '#292828', fg = '#a0a0a0' }) -- Unfocus modified buffer
vim.api.nvim_set_hl(0, 'MiniTablineFill', { bg = '#292828' })                            -- Fill area
vim.api.nvim_set_hl(0, 'MiniTablineTabpagesection', { bg = '#292828', fg = '#ffffff' })  -- Tabpage section
-- ╔═══════════════════════╗
-- ║    Plugins            ║
-- ╚═══════════════════════╝

-- Incline
highlight(0, 'InclineNormal', { bg = 'NONE', fg = '#80AA9E' })
highlight(0, 'HlSearchLens', { fg = 'darkgray' })
highlight(0, 'HlSearchLensNear', { fg = 'darkgray' })

-- Neotree

highlight(0, 'NeoTreeEndOfBuffer', { fg = 'darkgray' })
highlight(0, 'NeotreeNormal', { fg = 'darkgray' })
highlight(0, 'NeoTreeWinSeparator', { fg = "#292828" })
-- Flash

highlight(0, 'FlashLabel', { bg = 'NONE', fg= '#D89639',underline = false})


