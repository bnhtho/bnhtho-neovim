-- /lua/map.lua

local keymap = vim.keymap
local custom_key = require('config.functions')
local builtin = require('telescope.builtin')
keymap.set("n", "<leader>a", "gg<S-v>G")

-- Moving around windows using s + h,j,k,l
keymap.set("n", "<leader>h", "<C-w>h")
keymap.set("n", "<leader>j", "<C-w>j")
keymap.set("n", "<leader>k", "<C-w>k")
keymap.set("n", "<leader>l", "<C-w>l")

-- Split windows
keymap.set('n', 'sj', ':split<cr><C-w>w')
keymap.set('n', 'sl', ':vsplit<cr><C-w>w')
-- Buffer split
keymap.set('n', 'L', '<cmd>:bprev<cr>', { noremap = false, silent = true })
keymap.set('n', 'H', '<cmd>:bnext<cr>', { noremap = false, silent = true })
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
keymap.set("n", "W", "<cmd>:bdelete<cr>", { noremap = false, silent = true })
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
end)
-- NOTE: Telescope
keymap.set("n", "<leader>h", "<cmd>TodoTelescope<cr>")
keymap.set('n', '<Tab>', builtin.buffers, { desc = 'Telescope buffers' })


vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>o', '<cmd>:Telescope aerial<CR>')
