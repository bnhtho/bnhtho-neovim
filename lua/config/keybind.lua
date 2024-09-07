-- /lua/map.lua

local keymap = vim.keymap

keymap.set('n', '<leader>a', 'gg<S-v>G')
-- Toggle NeoTree sidebar
keymap.set('n', '<leader>e', ':NvimTreeToggle<cr>')

-- Moving around windows using s + h,j,k,l
keymap.set('n', '<leader>h', '<C-w>h')
keymap.set('n', '<leader>j', '<C-w>j')
keymap.set('n', '<leader>k', '<C-w>k')
keymap.set('n', '<leader>l', '<C-w>l')

-- Split windows
keymap.set('n', 'ss', ':split<cr><C-w>w')
keymap.set('n', 'sv', ':vsplit<cr><C-w>w')

-- Next/Prev tab page
keymap.set('n', '<leader>n', ':BufferLineCycleNext<CR>')
keymap.set('n', '<leader>b', ':BufferLineCyclePrev<CR>')

-- Close all tabs
keymap.set('n', '<leader>ta', [[:tabedit<cr>:BufferLineCloseLeft<cr>:BufferLineCloseRight<cr>]])
-- Keep current tab and close the others
keymap.set('n', '<leader>to', [[:BufferLineCloseLeft<cr>:BufferLineCloseRight<cr>]])

-- Save file
keymap.set('n', '<C-s>', ':w<cr>')
-- do somthing else

-- Move lines and group lines left, right
keymap.set('v', '>', '>gv')
keymap.set('v', '<', '<gv')

-- Keymap
keymap.set({'n', 't'}, '<C-h>', '<CMD>NavigatorLeft<CR>')
keymap.set({'n', 't'}, '<C-l>', '<CMD>NavigatorRight<CR>')
keymap.set({'n', 't'}, '<C-k>', '<CMD>NavigatorUp<CR>')
keymap.set({'n', 't'}, '<C-j>', '<CMD>NavigatorDown<CR>')