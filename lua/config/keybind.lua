-- /lua/map.lua

local keymap = vim.keymap
local snap = require("snap")
keymap.set("n", "<leader>a", "gg<S-v>G")
keymap.set("n", "<leader>t", "<Cmd>:Neotree toggle<CR>")

-- Moving around windows using s + h,j,k,l
keymap.set("n", "<leader>h", "<C-w>h")
keymap.set("n", "<leader>j", "<C-w>j")
keymap.set("n", "<leader>k", "<C-w>k")
keymap.set("n", "<leader>l", "<C-w>l")

-- Split windows
keymap.set("n", "sj", ":split<cr><C-w>w")
keymap.set("n", "sl", ":vsplit<cr><C-w>w")

-- Save file
keymap.set("n", "<C-s>", ":w<cr>")
-- do somthing else

-- Move lines and group lines left, right
keymap.set("v", ">", ">gv")
keymap.set("v", "<", "<gv")

-- Keymap
keymap.set({"n", "t"}, "<C-h>", "<CMD>NavigatorLeft<CR>")
keymap.set({"n", "t"}, "<C-l>", "<CMD>NavigatorRight<CR>")
keymap.set({"n", "t"}, "<C-k>", "<CMD>NavigatorUp<CR>")
keymap.set({"n", "t"}, "<C-j>", "<CMD>NavigatorDown<CR>")

-- Tab
keymap.set("n", "<Tab>", ":bnext<CR>", {silent = true})
keymap.set("n","<leader>w",":Bdelete<CR>")
--
keymap.set("n", "D", "<Cmd>copy.<Cr>")
keymap.set("x", "<C-d>", ":copy.-1<Cr>gv")
-- J
if vim.o.wrap then
    keymap.set("n", "j", [[v:count ? 'j' : 'gj']], {expr = true})
    keymap.set("n", "k", [[v:count ? 'k' : 'gk']], {expr = true})
end


-- Comments