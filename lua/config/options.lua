-- author: thohnb
-- Options for Neovim (Global)
-- Kickstart Ref:
-- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
local global = vim.g
local options = vim.opt
-- //ANCHOR - Options
options.number = true
options.showmode = false

-- Ignore case and smartcase
options.ignorecase = true
options.smartcase = true

-- Configure how new splits should be opened
options.splitright = true
options.splitbelow = true
-- Sets how neovim will display certain whitespace characters in the editor.
-- options.list = true
-- options.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- Hide tildes (~)
options.fillchars = {eob = " "}
-- Preview substitutions live, as you type!
options.inccommand = 'split'

-- Show which line your cursor is on
options.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
options.scrolloff = 10
-- popup whichkey sooner
options.timeoutlen = 300
-- Disable hlsearch
options.hlsearch = false
-- Word Wrap
options.wrap = true
-- options
options.cmdheight = 0
options.swapfile = false

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
