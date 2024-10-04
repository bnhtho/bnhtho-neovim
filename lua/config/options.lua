-- ╔═══════════════════════╗
-- ║ Options               ║
-- ╚═══════════════════════╝
-- Local Variables
local options = vim.opt
vim.cmd.colorscheme('gruvbox-material')
-- ╔═══════════════════════╗
-- ║ UI                    ║
-- ╚═══════════════════════╝
options.fillchars = { eob = " " }
options.termguicolors = true
options.shiftwidth = 4
options.softtabstop = 4
options.number = true
options.relativenumber = true

-- ╔═══════════════════════╗
-- ║ Split                 ║
-- ╚═══════════════════════╝
options.splitright = true
options.splitbelow = true
-- ╔═══════════════════════╗
-- ║ Status Line           ║
-- ╚═══════════════════════╝
options.laststatus = 3
options.showmode = false
options.cmdheight = 0
-- ╔═══════════════════════╗
-- ║ Search                ║
-- ╚═══════════════════════╝
options.ignorecase = true
options.smartcase = true
options.hlsearch = true
-- ╔═══════════════════════╗
-- ║ Other                 ║
-- ╚═══════════════════════╝
options.inccommand = 'split'
options.scrolloff = 10
options.wrap = true
options.swapfile = false
options.updatetime = 200

-- ╔═══════════════════════╗
-- ║ Mouse                 ║
-- ╚═══════════════════════╝
options.mousescroll = "ver:0,hor:0"
options.mousemodel = 'extend'
