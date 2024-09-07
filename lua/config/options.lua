-- author: thohnb
-- Options for Neovim (Global)
-- Kickstart Ref:
-- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
local global = vim.g
local options = vim.opt
options.number = true
options.showmode = false
-- Case
options.ignorecase = true
options.smartcase = true
-- split
options.splitright = true
options.splitbelow = true
-- Fillchar
options.fillchars = {eob = " "}
options.inccommand = 'split'
options.scrolloff = 10
-- popup whichkey sooner
-- Disable hlsearch
options.hlsearch = false
-- Word Wrap
options.wrap = true
-- Gui 
options.cmdheight = 0
options.showtabline = 3
options.laststatus = 3
-- Disable swapsize
options.swapfile = false