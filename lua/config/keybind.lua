-- /lua/map.lua

local keymap = vim.keymap
local custom_key = require('config.functions')

keymap.set("n", "<leader>a", "gg<S-v>G")

-- Moving around windows using s + h,j,k,l
keymap.set("n", "<leader>h", "<C-w>h")
keymap.set("n", "<leader>j", "<C-w>j")
keymap.set("n", "<leader>k", "<C-w>k")
keymap.set("n", "<leader>l", "<C-w>l")

-- Split windows
-- Pick buffer first, then split horizontally
-- Horizontal split with buffer pick
keymap.set("n", "sj", function()
    custom_key.pick_buffer_and_split("sp")
end)

-- Vertical split with buffer pick
keymap.set("n", "sl", function()
    custom_key.pick_buffer_and_split("vsp")
end)


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
keymap.set("n", "W", "<cmd>:bdelete<cr>",{ noremap = false, silent = true })
keymap.set("n", "D", "<Cmd>copy.<Cr>")
keymap.set("x", "D", ":copy.-1<Cr>gv")
if vim.o.wrap then
	keymap.set("n", "j", [[v:count ? 'j' : 'gj']], { expr = true })
	keymap.set("n", "k", [[v:count ? 'k' : 'gk']], { expr = true })
end
keymap.set('n', 'q:', function() end)
keymap.set('n', '<leader>t', "<CMD>Neotree toggle <CR>")
-- Delete floating windows
keymap.set('n', '<ESC>', "<cmd>:only<cr>")
-- Buffer
  vim.api.nvim_set_keymap('n', 'L', ':bnext<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', 'H', ':bprev<CR>', { noremap = true, silent = true })
  
keymap.set('n', '<leader>h', function()
    custom_key.pick_todo()
end)


  
