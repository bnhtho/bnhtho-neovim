-- author: thohnb
-- Options for Neovim (Global)
-- Kickstart Ref:
-- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
local global = vim.g
local options = vim.opt
vim.cmd.colorscheme('gruvbox-material')
-- set theme
options.number = true
options.showmode = false
-- Case
options.ignorecase = true
options.smartcase = true
-- split
options.splitright = true
options.splitbelow = true
-- Fillchar
options.fillchars = { eob = " " }
options.inccommand = 'split'
options.scrolloff = 10
-- popup whichkey sooner
-- Disable hlsearch
options.hlsearch = false
options.wrap = true
-- Gui
options.cmdheight = 0
options.showtabline = 3
options.laststatus = 3
-- Disable swapsize
options.swapfile = false

vim.opt.termguicolors = true
vim.opt.updatetime = 200
-- Disable Mouse
-- vim.opt.mouse = ''
vim.opt.mousescroll = "ver:0,hor:0"
vim.opt.mousemodel = 'extend'
