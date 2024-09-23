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
--  Mini.Tabline
vim.api.nvim_set_hl(0, 'MiniTablineFill', { bg = '#292828' })
vim.api.nvim_set_hl(0, 'MiniTablineCurrent', { bg = '#292828', fg = '#D2A655' })         -- Active buffer
vim.api.nvim_set_hl(0, 'MiniTablineVisible', { bg = '#292828', fg = 'NONE' })            -- Visible buffer
vim.api.nvim_set_hl(0, 'MiniTablineHidden', { bg = '#292828', fg = '#a0a0a0' })          -- Inactive buffer (gray)
vim.api.nvim_set_hl(0, 'MiniTablineModifiedCurrent', { bg = '#3c3c3c', fg = '#D2A655' }) -- Active modified buffer
vim.api.nvim_set_hl(0, 'MiniTablineModifiedVisible', { bg = '#292828', fg = '#D2A655' }) -- Visible modified buffer
vim.api.nvim_set_hl(0, 'MiniTablineFill', { bg = '#292828' })                            -- Fill area
vim.api.nvim_set_hl(0, 'MiniTablineTabpagesection', { bg = '#292828', fg = '#ffffff' })  -- Tabpage section
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'NONE', fg = '#a0a0a0' })


-- Bufferline
local hl = vim.api.nvim_set_hl
-- Underline UI (Done)
hl(0, "BufferLineDiagnosticSelected", { bg = "#292828", fg = "#D2A655" })
hl(0, "BufferLineHint", { bg = "#292828", fg = "#D2A655" })
hl(0, "BufferLineDiagnosticVisible", { bg = "#292828", fg = "#D2A655" })
hl(0, "BufferLineInfo", { bg = "#292828", fg = "#D2A655" })
hl(0, "BufferLineCloseButtonSelected", { bg = "#292828", fg = "#D2A655" })
hl(0, "BufferLineFill", { bg = "#292828", fg = "#D2A655" })
hl(0, "BufferLineCloseButtonVisible", { bg = "#292828", fg = "#D2A655" })
hl(0, "BufferLineOffsetSeparator", { bg = "#292828", fg = "#D2A655" })
hl(0, "BufferLinePickVisible", { bg = "#292828", fg = "#D2A655" })
hl(0, "BufferLinePickSelected", { bg = "#292828", fg = "#D2A655" })
hl(0, "BufferLineIndicatorSelected", { bg = "#292828", fg = "#D2A655" })
hl(0, "BufferLineTabSeparatorSelected", { bg = "#292828", fg = "#D2A655" })
hl(0, "BufferLineTabSeparator", { bg = "#292828", fg = "#D2A655" })
hl(0, "BufferLineDuplicate", { bg = "#292828", fg = "#D2A655" })
hl(0, "WinBar", { bg = "#292828", fg = "#D2A655" })
hl(0, "WinBarNC", { bg = "#292828", fg = "#D2A655" })
-- End Underline UI
hl(0, 'BufferLineDevIconPySelected', { underline = true ,fg = Comment})
-- hl(0, "BufferLineDuplicateSelected", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineModifiedSelected", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineModifiedVisible", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineErrorDiagnosticSelected", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineWarning", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineErrorDiagnostic", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineErrorSelected", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineErrorVisible", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineWarningDiagnosticSelected", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineWarningDiagnosticVisible", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineWarningDiagnostic", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineWarningSelected", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineWarningVisible", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineInfoDiagnosticSelected", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineInfoDiagnosticVisible", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineInfoDiagnostic", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineInfoSelected", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineInfoVisible", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLinePick", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineHintDiagnosticVisible", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineHintDiagnostic", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineHintSelected", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineHintVisible", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineModified", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineNumbersVisible", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineNumbersSelected", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineTab", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineBufferVisible", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineError", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineDiagnostic", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineCloseButton", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineTabClose", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineTabSelected", { bg = "#292828", fg = "#D2A655" })
-- -- hl(0, "BufferLineGroupLabel", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineGroupSeparator", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineTruncMarker", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineHintDiagnosticSelected", { bg = "#292828", fg = "#D2A655" })
-- hl(0, "BufferLineErrorDiagnosticVisible", { bg = "#292828", fg = "#D2A655" })