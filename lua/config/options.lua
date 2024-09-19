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
options.laststatus = 3
-- Disable swapsize
options.swapfile = false

options.termguicolors = true
options.updatetime = 200
-- Disable Mouse
-- vim.opt.mouse = ''
options.mousescroll = "ver:0,hor:0"
options.mousemodel = 'extend'
-- redrirect :h to help floating board
local function cmd_abbrev(abbrev, expansion)
	local cmd = 'cabbr ' ..
	    abbrev .. ' <c-r>=(getcmdpos() == 1 && getcmdtype() == ":" ? "' .. expansion .. '" : "' .. abbrev .. '")<CR>'
	vim.cmd(cmd)
end

cmd_abbrev('h', 'FloatingHelp')
cmd_abbrev('help', 'FloatingHelp')
cmd_abbrev('helpc', 'FloatingHelpClose')
cmd_abbrev('helpclose', 'FloatingHelpClose')
