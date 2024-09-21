-- /lua/map.lua

local keymap = vim.keymap
keymap.set("n", "<leader>a", "gg<S-v>G")
-- Moving around windows using s + h,j,k,l
keymap.set("n", "<leader>h", "<C-w>h")
keymap.set("n", "<leader>j", "<C-w>j")
keymap.set("n", "<leader>k", "<C-w>k")
keymap.set("n", "<leader>l", "<C-w>l")

-- Split windows
keymap.set("n", "sj", ":split|enew<cr>")
keymap.set("n", "sl", ":vsplit|enew<cr>")
-- Ovveride keybind split
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
-- Tab
keymap.set("n", "<leader>w", "<CMD>bdelete<cr>")

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
-- H/L to next buffer/previous buffer
keymap.set('n', 'L', '<cmd>:bnext<cr>', { noremap = true, silent = true })
keymap.set('n', 'H', '<cmd>:bprev<cr>', { noremap = true, silent = true })
vim.opt.wildcharm = vim.fn.char2nr('\26')
-- Map <Tab> to trigger buffer switching with wildcharm
keymap.set('n', '<Tab>', ':buffer ', { noremap = true, silent = false })