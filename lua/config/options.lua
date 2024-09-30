-- ╔═══════════════════════╗
-- ║ Options               ║
-- ╚═══════════════════════╝
-- Local Variables
local global = vim.g
local options = vim.opt
-- ╔═══════════════════════╗
-- ║ UI                    ║
-- ╚═══════════════════════╝
options.fillchars = { eob = " " }
vim.cmd.colorscheme('gruvbox-material')
options.termguicolors = true
options.number = true
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

