-- /lua/map.lua

local keymap = vim.keymap
local custom_key = require('config.functions')
local builtin = require('telescope.builtin')
keymap.set("n", "<leader>a", "gg<S-v>G",{desc = "Select All"})

-- Moving around windows using s + h,j,k,l
keymap.set("n", "<leader>h", "<C-w>h",{desc = "Focus Left Window"})
keymap.set("n", "<leader>j", "<C-w>j",{desc = "Focus Lower Window"})
keymap.set("n", "<leader>k", "<C-w>k",{desc = "Focus Upper Window"})
keymap.set("n", "<leader>l", "<C-w>l",{desc = "Focus Right Window"})

-- Split windows
keymap.set('n', 'sj', ':split<cr><C-w>w',{desc = "Split Down"})
keymap.set('n', 'sl', ':vsplit<cr><C-w>w',{desc = "Split Right"})
-- Buffer split
keymap.set('n', 'L', '<cmd>:bprev<cr>', { noremap = false, silent = true },{desc = "Switch To Last Buffer"})
keymap.set('n', 'H', '<cmd>:bnext<cr>', { noremap = false, silent = true },{desc = "Switch To Next Buffer"})
keymap.set("n", "W", "<cmd>:bdelete<cr>", { noremap = false, silent = true,desc= "Delete Current Buffer" })
-- Save file
keymap.set("n", "<C-s>", ":w<cr>")
-- Move lines and group lines left, right
keymap.set("v", ">", ">gv")
keymap.set("v", "<", "<gv")

-- Keymap
keymap.set({ "n", "t" }, "<C-h>", "<CMD>NavigatorLeft<CR>")
keymap.set({ "n", "t" }, "<C-l>", "<CMD>NavigatorRight<CR>")
keymap.set({ "n", "t" }, "<C-k>", "<CMD>NavigatorUp<CR>")
keymap.set({ "n", "t" }, "<C-j>", "<CMD>NavigatorDown<CR>")
keymap.set("n", "D", "<Cmd>copy.<Cr>")
keymap.set("x", "D", ":copy.-1<Cr>gv")
if vim.o.wrap then
	keymap.set("n", "j", [[v:count ? 'j' : 'gj']], { expr = true })
	keymap.set("n", "k", [[v:count ? 'k' : 'gk']], { expr = true })
end
keymap.set('n', 'q:', function() end)
keymap.set('n', '<leader>t', "<CMD>Neotree toggle <CR>")
-- NOTE : Hightlight
keymap.set('n', '<leader>/', function()
	custom_key.pick_todo()
end,{noremap = true,desc="Select Highlight"})
-- NOTE: Telescope
keymap.set("n", "<leader>h", "<cmd>TodoTelescope<cr>",{desc = "Show Todo in Telescope"})
keymap.set('n', '<Tab>', builtin.buffers, { desc = 'List Buffers' })


vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>o', '<cmd>:Telescope aerial<CR>',{desc = "Toggle Telescope Aerial"})

vim.api.nvim_set_keymap('n', ':', ':Telescope cmdline<CR>', { noremap = true, desc = "Show Command Line",silent = true })