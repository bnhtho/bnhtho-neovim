-- author: thohnb
-- Options for Neovim (Global)
-- Kickstart Ref:
-- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
local global = vim.g
local options = vim.opt
-- //ANCHOR - Options
options.number = true
options.showmode = false

vim.schedule(function()
    options.clipboard = 'unnamedplus'
end)
-- Ignore case and smartcase
options.ignorecase = true
options.smartcase = true

-- Configure how new splits should be opened
options.splitright = true
options.splitbelow = true
-- Sets how neovim will display certain whitespace characters in the editor.
options.list = true
options.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
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
