-- author: thohnb
-- Highlight theme
-- //SECTION: Highlight 
-- Set StatusLine transparent
vim.cmd(':hi StatusLine ctermbg=NONE cterm=NONE')
-- CMP
-- gray
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg='NONE', strikethrough=true, fg='#808080' })
-- blue
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg='NONE', fg='#569CD6' })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link='CmpIntemAbbrMatch' })
-- light blue
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg='NONE', fg='#9CDCFE' })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link='CmpItemKindVariable' })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { link='CmpItemKindVariable' })
-- pink
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg='NONE', fg='#C586C0' })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link='CmpItemKindFunction' })
-- front
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg='NONE', fg='#D4D4D4' })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link='CmpItemKindKeyword' })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link='CmpItemKindKeyword' })

-- Neotree : normal color
-- Ref:https://github.com/sainnhe/gruvbox-material/issues/182
vim.cmd([[
              highlight! link NeoTreeNormal Normal
              highlight! link NeoTreeEndOfBuffer Normal
]])


-- Định nghĩa các nhóm highlight với màu sắc đã cập nhật
vim.cmd([[
  " Thiết lập màu nền và màu chữ cho TabLine tổng quát
  highlight! TabLine ctermbg=none ctermfg=none
  
  " Thiết lập màu nền cho không gian không có tab (nơi không có tab hiển thị)
  highlight! TabLineFill ctermbg=none ctermfg=none
  
  " Thiết lập màu nền và màu chữ cho tab đang được chọn (tab hiện tại)
  highlight! TabLineSel ctermbg=blue ctermfg=white
  
  " Thiết lập màu nền và màu chữ cho tab đang hoạt động (tab hiện tại)
  highlight! TabLineActive gui = underline
  
  " Thiết lập màu nền và màu chữ cho tab không hoạt động (tab không hiện tại)
  highlight! TabLineInactive ctermbg=NONE ctermfg=darkgray
]])