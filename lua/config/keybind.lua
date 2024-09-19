-- /lua/map.lua

local keymap = vim.keymap
local snap = require("snap")
keymap.set("n", "<leader>a", "gg<S-v>G")

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

-- Move lines and group lines left, right
keymap.set("v", ">", ">gv")
keymap.set("v", "<", "<gv")

-- Keymap
keymap.set({"n", "t"}, "<C-h>", "<CMD>NavigatorLeft<CR>")
keymap.set({"n", "t"}, "<C-l>", "<CMD>NavigatorRight<CR>")
keymap.set({"n", "t"}, "<C-k>", "<CMD>NavigatorUp<CR>")
keymap.set({"n", "t"}, "<C-j>", "<CMD>NavigatorDown<CR>")
-- Tab

-- Buffer Switch to last edit
vim.keymap.set('n', '<S-Tab>', '<cmd>:buffer#<cr>', { noremap = true, silent = false })

keymap.set("n","<leader>w","<CMD>bdelete<cr>")

keymap.set("n", "D", "<Cmd>copy.<Cr>")
keymap.set("x", "<C-d>", ":copy.-1<Cr>gv")
-- J
if vim.o.wrap then
    keymap.set("n", "j", [[v:count ? 'j' : 'gj']], {expr = true})
    keymap.set("n", "k", [[v:count ? 'k' : 'gk']], {expr = true})
end


function toggle_live_grep()
    require'snap'.run {
      producer = require'snap'.get'producer.ripgrep.vimgrep',
      select = require'snap'.get'select.vimgrep'.select,
      multiselect = require'snap'.get'select.vimgrep'.multiselect,
      views = {require'snap'.get'preview.vimgrep'}
    }
  end

keymap.set('n', '<leader>g', ':lua toggle_live_grep()<CR>')

keymap.set('n', 'q:', function() end)
keymap.set('n', '<leader>t', "<CMD>Neotree toggle <CR>")
-- Delete floating windows
keymap.set('n', '<ESC>', "<C-w>o")

-- Toggle terminal
keymap.set('n','<leader>`',"<CMD>ToggleTerm<CR>")

-- Map <Tab> to trigger buffer switching with wildcharm
keymap.set('n', '<Tab>', ':buffer ' .. vim.api.nvim_replace_termcodes('<C-Z>', true, true, true), { noremap = true, silent = false })
-- Split Buffer
-- Horizontal 
keymap.set('n', 'sb', ':sbuffer ' .. vim.api.nvim_replace_termcodes('<C-Z>', true, true, true), { noremap = true, silent = false })
-- Vertical
keymap.set('n', 'vb', ':vsplit ' .. vim.api.nvim_replace_termcodes('<C-Z>', true, true, true), { noremap = true, silent = false })
--
keymap.set('c', '<Down>', '<C-n>', { noremap = true, silent = true })
keymap.set('c', '<Up>', '<C-p>', { noremap = true, silent = true })